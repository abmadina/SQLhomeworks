# lesson-8 Practice


--1. Using Products table, find the total number of products available in each category.
select category, count(productID) as product_available
from products
group by category

--2. Using Products table, get the average price of products in the 'Electronics' category.
select category, avg(price) as avg_price
from products
group by category
having category='electronics'

--3. Using Customers table, list all customers from cities that start with 'L'.
select city, firstname, lastname from customers
where city like 'L%'

--4. Using Products table, get all product names that end with 'er'.
select productName from products
where productName like '%er'

--5. Using Customers table, list all customers from countries ending in 'A'.
select country from customers
where country like '%A'

--6. Using Products table, show the highest price among all products.
select max(price) as highest_price from products

--7. Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select count(stockQuantity) as Stock_Q,
iif (count(StockQuantity)<30,'low stock','sufficient') as stock_status
from products

--8. Using Customers table, find the total number of customers in each country.
select COUNTRY, COUNT(customerid) AS customers_in_country
from customers
group by country

--9. Using Orders table, find the minimum and maximum quantity ordered.
select min(quantity) as min_q,
       max(quantity) as max_q
       from orders
---
 
--10. Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
SELECT CustomerID
FROM Orders
WHERE YEAR(SaleDate) = 2023
  AND MONTH(SaleDate) = 1

EXCEPT
SELECT CustomerID
FROM Invoices;

--11. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select productname from products 
union 
select productname from products_discounted

--12. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select distinct productname from products 
union 
select distinct productname from products_discounted

--13. Using Orders table, find the average order amount by year.
select 
year(orderdate) as order_date,
avg(totalamount) as avg_amount
from orders
group by year(orderdate)

--14. Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select productname, price,
case
when price<100 then 'Low'
when price between 100 and 500 then 'Mid'
when price>500 then 'high'
end as price_group
from products

--15. Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
select*from city_population
pivot(sum(population)
for year
in  ([2012], [2013]))
as population_each_year;

--16. Using Sales table, find total sales per product Id.
select productID,
sum(saleamount) as sale_amount from Sales
group by productID

--17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select productname
from Products
where productname like '%oo%'

--18. Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy)  and copy results to a new Population_Each_City table.
select*
from city_population
pivot(sum(population)
for district_name
in  ([Bektemir], [Chilonzor], [Yakkasaroy]))
as population_in_district;

--19. Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
select top 3 customerID, sum(totalamount) as total_spent
from Invoices
group by CustomerID
order by sum(totalamount) desc;

--20. Transform Population_Each_Year table to its original format (City_Population).
SELECT 
    Year,
    Population
FROM Population_Each_Year
UNPIVOT (
    Population FOR Year IN ([2012], [2013])
) AS city_population;


--21. Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
SELECT 
  p.ProductName,
  COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s
  ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;

--22. Transform Population_Each_City table to its original format (City_Population).
SELECT 
    Year,
    District_Name,
    Population
FROM Population_Each_City
UNPIVOT (
    Population FOR District_Name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS unpivot
