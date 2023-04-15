-- Q1.
    select p.productName as name, od.productCode as code, sum(od.quantityOrdered) as quantity 
    from orderdetails as od 
    right join products as p on od.productCode = p.productCode 
    group by od.productCode 
    order by sum(od.quantityOrdered) desc 
    limit 5;

-- Q2a.
    select * 
    from products as p 
    order by p.MSRP-p.buyPrice DESC 
    limit 1;

-- Q2b.
    select count(*) 
    from orderdetails 
    where productCode = 
        (select p.productCode 
        from products as p 
        order by p.MSRP-p.buyPrice DESC 
        limit 1);

-- Q2c.
    select c.customerID, c.customerName, c.phone 
    from customers as c 
    right join orders as o on o.customerID = c.customerID 
    right join orderdetails as od on od.orderID = o.orderID 
    where od.productCode = 
        (select productCode 
        from products as p 
        order by p.MSRP-p.buyPrice DESC 
        limit 1);

-- Q2e. Should have worked if the database was consistent
    select p.productVendor, count(*) 
    from products as p 
    group by productVendor 
    order by count(*) DESC;

-- Other solution
    select s.productVendor 
    from products s
    where 
    (select count(distinct pds.type) from products pds) 
    = 
    (select count(distinct pd.Type) from products pd
    where s.productVendor = pd.productVendor);

-- Q4a.
    create table MSRPlog (
        productCode VARCHAR(15),
        MSRP decimal(10, 2),
        updatetime timestamp,
        foreign key (productCode) references products(productCode)
    );

    delimiter //
    create trigger msrplog
    after update on products
    for each row
        BEGIN
            insert into MSRPlog values 
            (NEW.productCode, NEW.MSRP, NOW());
        END //
    delimiter ;

    update products
    set MSRP = MSRP + 10
    where MSRP BETWEEN 0 AND 1000;

-- Q4b.
    create table type_orderdetails(
        orderID INT,
        productCode varchar(15),
        type varchar(50),
        quantityOrdered int,
        priceEach decimal(10, 2),
        foreign key (orderID) references orders(orderID),
        foreign key (productCode) references product(productCode)
    );

    delimiter //
    create procedure fetch_type_orderdetails(IN type VARCHAR(50))
        modifies sql data
        sql security invoker
        deterministic
    begin
        insert into type_orderdetails values (select order_ID, productCode, type, quantityOrdered from)
    end //
    delimiter ;

