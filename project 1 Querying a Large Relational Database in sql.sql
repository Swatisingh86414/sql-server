use AdventureWorks2012

--1 Get all the details from the person table including email ID, phone
number and  phone number type.

SELECT p.FirstName, p.LastName, e.EmailAddress, ph.PhoneNumber, pht.Name as PhoneNumberType
FROM Person.Person p
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID
JOIN Person.PhoneNumberType pht ON ph.PhoneNumberTypeID = pht.PhoneNumberTypeID;

--2 Get the details of the sales header order made in May 2011


SELECT SalesOrderID, OrderDate, CustomerID, DueDate,TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

--3 Get the details of the sales details order made in the month of May
2011

SELECT SOD.SalesOrderID, SOD.ProductID, SOD.OrderQty, SOD.UnitPrice, SOD.LineTotal, SOH.OrderDate
FROM Sales.SalesOrderDetail AS SOD JOIN Sales.SalesOrderHeader AS SOH
    ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE SOH.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

--4 Get the total sales made in May 2011

select sum(totaldue) as totalsales from Sales.SalesOrderHeader
where OrderDate BETWEEN '2011-05-01' AND '2011-05-31'

--5 Get the total sales made in the year 2011 by month order by increasing sales

SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(OrderDate), MONTH(OrderDate) ORDER BY TotalSales ASC;


--6 Get the total sales made to the customer with FirstName='Gustavo'and LastName ='Achong'SELECT SUM(SOH.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS C ON SOH.CustomerID = C.CustomerID
JOIN Person.Person AS P ON C.PersonID = P.BusinessEntityID
WHERE P.FirstName = 'Gustavo' AND P.LastName = 'Achong';
