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
userService int
);

CREATE TABLE [Address]
(
addressID int not null identity(1,1) primary key,
addressStreet nvarchar(255) not null,
addressZipCode int not null,
addressCity nvarchar(100) not null,
addressCountry int not null

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
employeeID int,
companyID int,

);


CREATE TABLE [Company]
(
companyID int not null identity(1,1) primary key,
companyEmail nvarchar(255) not null,
companyAddress int not null,
companyPhoneNR varchar(13) null,
serviceID int,
employeeID int
);



CREATE TABLE [Service]
(
serviceID int not null identity(1,1) primary key,
descriptionService nvarchar(500) not null,
serviceDate DATETIME not null,


);


ALTER TABLE [User] ADD CONSTRAINT FK_UserServices FOREIGN KEY (userService) REFERENCES [Service] (serviceID)
ALTER TABLE [Company] ADD CONSTRAINT FK_CompanyService FOREIGN KEY (serviceID) REFERENCES [Service] (serviceID)
ALTER TABLE [Contact] ADD CONSTRAINT FK_ContactWork FOREIGN KEY (employeeID) REFERENCES [Company] (companyID)
ALTER TABLE [Company] ADD CONSTRAINT FK_Company_Address FOREIGN KEY (companyAddress) REFERENCES [Address] (addressID)
ALTER TABLE [Company] ADD CONSTRAINT FK_Company_Contact FOREIGN KEY (employeeID) REFERENCES [Contact] (contactID)
ALTER TABLE [User] ADD CONSTRAINT FK_User_Address FOREIGN KEY (userAddress) REFERENCES [Address] (addressID)
ALTER TABLE [Address] ADD CONSTRAINT FK_Address_Country FOREIGN KEY (addressCountry) REFERENCES [Country] (countryID)
GO

INSERT INTO [Country] VALUES ('Sverige','swe','+46'),('Norge','nor','+47'),('Finland','fin','+358'),('Danmark','dnk','+45')
