CREATE TABLE [User]
(
userID int not null identity(1,1) primary key,
userFirstName nvarchar(50) not null,
userLastName nvarchar(50) not null,
userEmail nvarchar(255) not null unique,
userAddress int not null,
userGender char(1) not null,
userPhoneNr varchar(13) null,
userPassword nvarchar(255) not null,

);

CREATE TABLE [Address]
(
addressID int not null identity(1,1) primary key,
addressStreet nvarchar(255) not null,
addressZipCode nvarchar(15) not null,
addressCity nvarchar(100) not null,
addressCountry int not null

);

CREATE TABLE [CompanyService]
(
CompanyID int PRIMARY KEY,
ServiceID int UNIQUE
);

CREATE TABLE [Country]
(
countryID int not null identity(1,1) primary key,
countryName nvarchar(100) not null unique,
countryCode varchar(8) null unique, 
countryPhoneCode varchar(5) null unique

);


CREATE TABLE [Contact]
(
contactID int not null identity(1,1) primary key,
contactFirstName nvarchar(50),
contactLastName nvarchar(60),
contactPhoneNR nvarchar(13),

);


CREATE TABLE [Company]
(
companyID int not null identity(1,1) primary key,
companyEmail nvarchar(255) not null,
companyAddress int not null,
companyPhoneNR varchar(13) null,
employeeID int
);



CREATE TABLE [Service]
(
serviceID int not null identity(1,1) primary key,
descriptionService nvarchar(500) null,
serviceDate DATETIME null,

);

ALTER TABLE [Company] ADD CONSTRAINT FK_CompanyEmployee FOREIGN KEY (employeeID) REFERENCES [Contact] (contactID)
ALTER TABLE [Company] ADD CONSTRAINT FK_CompanyService FOREIGN KEY (companyID) REFERENCES [CompanyService] (CompanyID)
ALTER TABLE [Service] ADD CONSTRAINT FK_ContactWork FOREIGN KEY (serviceID) REFERENCES [CompanyService] (ServiceID)
ALTER TABLE [Company] ADD CONSTRAINT FK_Company_Address FOREIGN KEY (companyAddress) REFERENCES [Address] (addressID)
ALTER TABLE [User] ADD CONSTRAINT FK_User_Address FOREIGN KEY (userAddress) REFERENCES [Address] (addressID)
ALTER TABLE [Address] ADD CONSTRAINT FK_Address_Country FOREIGN KEY (addressCountry) REFERENCES [Country] (countryID)
GO

INSERT INTO [Country] VALUES ('Sverige','swe','+46'),('Norge','nor','+47'),('Finland','fin','+358'),('Danmark','dnk','+45')
