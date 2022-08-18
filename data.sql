USE CustomerLib_Levshinskii
GO

-- Valid data

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', '5828381477', 'eleifend.nunc.risus@hotmail.edu', '6000'),
    ('Allegra', 'Mcgee', '16526679310', 'consequat.nec@hotmail.com', '9000'),
    ('Jillian', 'Obrien', '17211857287', 'sed.hendrerit.a@yahoo.couk', '3000'),
    ('Kimberley', 'Miranda', '17746354765', 'netus.et.malesuada@hotmail.org', '6000'),
    (NULL, 'Terrell', NULL, NULL, NULL)

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Shipping', 'Prince Edward Island', '472309', 'Prince Edward Island', 'Canada'),
    (2, 'Nullam Av.', 'P.O. Box 780, 5820', 'Billing', 'Manitoba', '107868', 'Manitoba', 'Canada'),
    (3, 'Quam Av.', 'Ap #190-3988', 'Shipping', 'Arizona', '83541', 'Arizona', 'Canada'),
    (4, 'Dui, St.', 'Ap #961-7813', 'Billing', 'Florida', '423542', 'Florida', 'Canada'),
    (5, 'Phasellus St.', NULL, 'Shipping', NULL, NULL, NULL, NULL)

INSERT INTO Notes
    (CustomerId,Note)
VALUES
    (1, 'note 1'),
    (2, 'note 2'),
    (3, 'note 3'),
    (4, 'note 4'),
    (5, 'note 5')


-- Invalid data


-- Too long input
INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    (REPLICATE('a',51), 'Hickman', '5828381477', 'eleifend.nunc.risus@hotmail.edu', '6000')

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', REPLICATE('a',51), '5828381477', 'eleifend.nunc.risus@hotmail.edu', '6000')

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', REPLICATE('a',16), 'eleifend.nunc.risus@hotmail.edu', '6000')

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', '5828381477', REPLICATE('a',256), '6000')

-- Wrong Phone Num

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', '5828s381477', 'eleifend.nunc.risus@hotmail.edu', 1)

-- Wrong Email

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', '5828381477', 'eleifend.nunc.risushotmailedu', '6000')

-- Negative TotalPurchaseAmount

INSERT INTO Customer
    (FirstName,LastName,PhoneNumber,Email,TotalPurchasesAmount)
VALUES
    ('Fuller', 'Hickman', '5828381477', 'eleifend.nunc.risus@hotmail.edu', -1)


-- Too long inputs

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, REPLICATE('a',101), '262-5330', 'Shipping', 'Prince Edward Island',
        '472309', 'Prince Edward Island', 'Canada')

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', REPLICATE('a',101), 'Shipping', 'Prince Edward Island',
        '472309', 'Prince Edward Island', 'Canada')


INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Shipping', REPLICATE('a',51),
        '472309', 'Prince Edward Island', 'Canada')


INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Shipping', 'Prince Edward Island',
        '472309', REPLICATE('a',21), 'Canada')

-- CustomerId is not exist

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (0, 'Vehicula. Ave', '262-5330', 'Shipping', 'Prince Edward Island',
        '472309', 'Prince Edward Island', 'Canada')


-- Unknown Address Type

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Unknown', 'Prince Edward Island',
        '472309', 'Prince Edward Island', 'Canada')

-- Wrong Postal Code

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Shipping', 'Prince Edward Island',
        '47a309', 'Prince Edward Island', 'Canada')

--Not Allowed Country

INSERT INTO Address
    (CustomerId,AddressLine,AddressLine2,AddressType,City,PostalCode,State,Country)
VALUES
    (1, 'Vehicula. Ave', '262-5330', 'Shipping', 'Prince Edward Island',
        '471309', 'Prince Edward Island', 'Mexico')
