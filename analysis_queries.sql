select * from ChannelDim
select * from CustomerDim
select * from [Fact Sales]
select * from ProductDim
select * from SalesmanDim
select * from TimeDim

select distinct CustomerName ,ProductName,ProductPrice , SalesmanName from CustomerDim c
join [Fact Sales] fs
on c.CustomerID =fs.CustomerID
join ProductDim p
on p.ProductID=fs.ProductID
join SalesmanDim s
on s.SalesmanID=fs.SalesmanID


select count (ProductID)   from [Fact Sales]


-----------------
---Top Revenue_generating item

select  p.ProductName ,
SUM(fs.Qty) as how_much_unites,
sum(fs.[Qty Total price]) as totalprice
from CustomerDim c 
join [Fact Sales] fs 
  on c.CustomerID =fs.CustomerID
join ProductDim p
  on p.ProductID=fs.ProductID
GROUP BY                        
    p.ProductName

ORDER BY 
    p.ProductName,
    totalprice desc,
    how_much_unites;

---Top Revenue-generating item is sportswear  


--Ê »«· «·Ì Â⁄„· ⁄·ÌÂ ⁄—Ê÷ ⁄‘«‰ Ì‘ —Ê „‰Â 

-- ⁄œœ „—«  «·‘—«¡ (⁄œœ «·›Ê« Ì—)

--Top revenue-generating country
select  ch.Country ,
COUNT(*) as NumberOfTransactions,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from  ProductDim p
join [Fact Sales] fs
  on p.ProductID=fs.ProductID
join ChannelDim ch
    on ch.ChannalID=fs.ChannelID
GROUP BY 
    ch.Country

ORDER BY 
    totalprice desc ;
--Egypt: Max sales | Morocco: Min sales

--Most Frequent Buyer
select c.customername,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from CustomerDim c
join [Fact Sales] fs
on c.CustomerID=fs.CustomerID
join ProductDim p
on p.ProductID =fs.ProductID

group by 
    CustomerName
ORDER BY 
   totalprice desc ;
--Customer 3 : Top Customer by Revenue | Customer 4 : buttom Customer by Revenue 
--Customer 2 : Max Buyer 

-- «·«„«ﬂ‰ «·„‘ —ﬂÂ › «·«—»⁄Â „’— «⁄·Ì „»Ì⁄«  Ê «·„€—» «ﬁ· „»Ì⁄«  
select c.customername,Country,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from CustomerDim c
join [Fact Sales] fs
on c.CustomerID=fs.CustomerID
join ProductDim p
on p.ProductID =fs.ProductID
join ChannelDim ch
on ch.ChannalID=fs.ChannelID

group by 
    CustomerName,
    Country
ORDER BY 
   CustomerName,
   totalprice desc ;
   

--Top-selling employee
select SalesmanName ,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from SalesmanDim s
join [Fact Sales] fs
on fs.SalesmanID =s.SalesmanID
join ProductDim p
on p.ProductID=fs.ProductID
group by 
SalesmanName 
order by 
    totalprice desc ;
 
 ----
--Top employee's sales location
select SalesmanName ,Country ,
SUM(fs.Qty) as howmuch, 
sum(fs.[Qty Total price]) as totalprice
from SalesmanDim s
join [Fact Sales] fs
on fs.SalesmanID =s.SalesmanID
join ProductDim p
on p.ProductID=fs.ProductID
join ChannelDim ch
on ch.ChannalID =fs.ChannelID
group by 
SalesmanName,
Country
order by 
    SalesmanName desc,
    totalprice desc ;
 ------
 --Top employee's best-selling products
select SalesmanName , ProductName,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from SalesmanDim s
join [Fact Sales] fs
on fs.SalesmanID =s.SalesmanID
join ProductDim p
on p.ProductID=fs.ProductID
group by 
SalesmanName , 
ProductName
order by 
SalesmanName desc,
totalprice desc ;


 --Product performance per Region
select ProductName,country ,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from ChannelDim  c
join [Fact Sales] fs
on fs.SalesmanID =c.ChannalID
join ProductDim p
on p.ProductID=fs.ProductID
group by 
Country , 
ProductName
order by 
ProductName,
totalprice desc,
howmuch desc;

 -- «·› —Â «··Ï Õ’· ›ÌÂ« »Ì⁄
select CalendarQuarter , CalendarYear,ProductName,
SUM(fs.Qty) as howmuch,
sum(fs.[Qty Total price]) as totalprice
from TimeDim t
join [Fact Sales] fs 
on t.TimeID=fs.TimeID
join ProductDim p
on p.ProductID=fs.ProductID
group by 
CalendarQuarter,
CalendarYear,
ProductName
order by 
CalendarQuarter,
totalprice desc,
CalendarYear;