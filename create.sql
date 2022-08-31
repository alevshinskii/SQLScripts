CREATE DATABASE [CustomerLib_Levshinskii]
GO

USE [CustomerLib_Levshinskii]
GO

CREATE TABLE Customer
(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) CHECK (LEN(FirstName)<=50),
    LastName NVARCHAR(50) NOT NULL CHECK (LEN(LastName)<=50),
    PhoneNumber NVARCHAR(15) CHECK (LEN(PhoneNumber)<=15 AND LEN(PhoneNumber)>0),
    Email NVARCHAR(255) CHECK(Email LIKE  '%@%.%'),
    TotalPurchasesAmount MONEY CHECK(TotalPurchasesAmount >= 0)
)

CREATE TABLE Address
(
    AddressId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
    AddressLine NVARCHAR(100) NOT NULL CHECK (LEN(AddressLine)<=100),
    AddressLine2 NVARCHAR(100) CHECK (LEN(AddressLine2)<=100),
    AddressType NVARCHAR(20) CHECK (AddressType IN ('Shipping', 'Billing')),
    City NVARCHAR(50) CHECK (LEN(City)<=50),
    PostalCode NVARCHAR(6) CHECK (LEN(PostalCode)<=6 AND LEN(PostalCode)>=4 AND
            (
        PostalCode LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'
            OR PostalCode LIKE '[0-9][0-9][0-9][0-9][0-9]'
            OR PostalCode LIKE '[0-9][0-9][0-9][0-9]'
        )),
    State NVARCHAR(20) CHECK (LEN(State)<=20),
    Country NVARCHAR(100) CHECK(Country in ('United States', 'Canada'))
)

CREATE TABLE Notes
(
    NoteId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
    Note NVARCHAR(255)
)
