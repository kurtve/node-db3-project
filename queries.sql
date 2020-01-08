-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select ProductName, CategoryName
from Product p left join Category c
    on p.CategoryId = c.Id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id as [Order Id], s.CompanyName as [Shipper CompanyName]
from [Order] o left join Shipper s
    on o.ShipVia = s.Id
where o.OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, sum(od.Quantity) as Quantity
from OrderDetail od left join Product p
    on od.ProductId = p.Id
where od.OrderId = 10251
group by p.ProductName
order by 1;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id as [Order Id]
	  , c.CompanyName as [Customer Company Name]
	  , e.LastName as [Employee Last Name]
from [Order] o
    left join Customer c
    on o.CustomerId = c.Id
    left join Employee e
    on o.EmployeeId = e.Id
order by 1;

-- returns 16,818 records
-- there are 29 records with null CompanyName, but I think we still want to display those
-- hence the left join instead of an inner join
