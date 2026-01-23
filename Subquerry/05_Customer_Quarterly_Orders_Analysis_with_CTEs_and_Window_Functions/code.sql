-- =====================================================
-- Example of nested subqueries and CTEs to calculate total orders per customer per quarter
-- and compare current quarter with previous quarter using lag
-- =====================================================

-- Step 1: Calculate total orders per customer per quarter
with CusTotal as (
    select
        sum(total_order_sum) as TotalSum,
        CustomerName,
        QuarterNumber
    from (
        select
            year(soh.OrderDate) as OrderYear,
            datepart(quarter, soh.OrderDate) as QuarterNumber,
            ord.UnitPrice * ord.OrderQty * (1 - ord.UnitPriceDiscount) as total_order_sum,
            case
                when pp.MiddleName is null then concat(pp.FirstName, ' ', pp.LastName)
                else concat(pp.FirstName, ' ', pp.MiddleName, '. ', pp.LastName)
            end as CustomerName
        from Sales.SalesOrderDetail as ord
        left join Sales.SalesOrderHeader as soh
            on ord.SalesOrderID = soh.SalesOrderID
        left join Sales.Customer as cus
            on cus.CustomerID = soh.CustomerID
        left join Person.Person as pp
            on cus.PersonID = pp.BusinessEntityID
        where year(soh.OrderDate) = 2013
    ) as sub
    group by CustomerName, QuarterNumber
),

-- Step 2: Calculate previous quarter total and percent change
ns as (
    select top 10
        CustomerName, 
        prev as [PreviousQuarterTotal],
        TotalSum as CurrentQuarterTotal, 
        percent_change_between_previous_and_current_quarter as PercentChange, 
        QuarterNumber 
    from (
        select 
            TotalSum, 
            QuarterNumber, 
            CustomerName, 
            OrderedByQuarter, 
            -- lag function to get previous quarter total
            lag(TotalSum) over (partition by CustomerName order by OrderedByQuarter) as prev, 
            -- calculate percent change from previous quarter
            case 
                when lag(TotalSum) over(partition by CustomerName order by OrderedByQuarter) is null 
                then null 
                else ((TotalSum - lag(TotalSum) over(partition by CustomerName order by OrderedByQuarter)) 
                      / lag(TotalSum) over(partition by CustomerName order by OrderedByQuarter)) * 100
            end as percent_change_between_previous_and_current_quarter
        from (
            -- rank quarters per customer to ensure proper ordering
            select 
                TotalSum, 
                CustomerName, 
                QuarterNumber, 
                rank() over (partition by CustomerName order by QuarterNumber asc) as OrderedByQuarter
            from CusTotal
        ) as dd
    ) as dp 
    order by percent_change_between_previous_and_current_quarter desc
)

-- Final output: top 10 customers with largest percent change
select *
from ns;
