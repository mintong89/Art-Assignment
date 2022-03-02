USE ArtDB;
GO

DROP TABLE IF EXISTS [dbo].[ArtProd];
GO

DROP TABLE IF EXISTS [dbo].[User];
GO

CREATE TABLE [dbo].[User] (
  [ID] varchar(200) NOT NULL PRIMARY KEY,
  [IsActive] BIT,
  [Name] varchar(255) NOT NULL,
  [Password] varchar(255) NOT NULL,
  [FirstName] varchar(255),
  [LastName] varchar(255) NOT NULL,
  [Email] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL,
  [DateBirth] Date, --This one suppose to be enter by user

  -- Common Fields
  [DateCreated] Date,
  [DateModified] Date,
  [DateDeleted] Date,
  CONSTRAINT FirstName CHECK (FirstName NOT LIKE '% [^A-Z] % ]'), 
  CONSTRAINT LastName CHECK (LastName NOT LIKE '% [^A-Z] % ]')
);
GO

DROP TABLE IF EXISTS [dbo].[Artist];
GO

CREATE TABLE [dbo].[Artist] (
  [ID] varchar(255) NOT NULL PRIMARY KEY,
  [Name] varchar(255) NOT NULL,
  [Email] varchar(255),
  [BioDesc] varchar(255),
  [Rating] int,
  [UserID] varchar(255) FOREIGN KEY REFERENCES [dbo].[User](ID),

  -- Common Fields
  DateCreated Date,
  DateModified Date,
  DateDeleted Date
);
GO

CREATE TABLE [dbo].[ArtProd] (
  [ID] varchar(255) NOT NULL PRIMARY KEY,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255),
  [ArtistOwner] varchar(255) FOREIGN KEY REFERENCES [dbo].[Artist](ID),

  -- Common Fields
  [DateCreated] Date,
  [DateModified] Date,
  [DateDeleted] Date
);
GO

DROP TABLE IF EXISTS [dbo].[Order];
GO

CREATE TABLE [dbo].[Order] (
  [ID] varchar(255) NOT NULL PRIMARY KEY,
  [Address1] varchar(255) NOT NULL,
  [Address2] varchar(255) NOT NULL,
  [State] varchar(255) NOT NULL,
  [Country] varchar(255) NOT NULL,
  [OrderTotal] float NOT NULL,
  [DeliveryFee] int NOT NULL,
  [OrderMadeBy] varchar(255) NOT NULL FOREIGN KEY REFERENCES [dbo].[User](ID),

  -- Common Fields
  [DateCreated] Date,
  [DateModified] Date,
  [DateDeleted] Date
);
GO

DROP TABLE IF EXISTS [dbo].[OrderItem];
GO

CREATE TABLE [dbo].[OrderItem] (
  OrderID varchar(255) NOT NULL,
  ArtItemID varchar(255) NOT NULL,
  CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[Order](ID),
  CONSTRAINT FK_ArtItemID FOREIGN KEY (ArtItemID) REFERENCES [dbo].[ArtProd](ID), 
  CONSTRAINT [PK_OrderItem] PRIMARY KEY ([ArtItemID], [OrderID])
);
GO

DROP TABLE IF EXISTS [dbo].[Payment];
GO

CREATE TABLE [dbo].[Payment] (
  [ID] varchar(255) NOT NULL PRIMARY KEY,
  [Status] varchar(255) NOT NULL,
  [PaymentMethod] varchar(255) NOT NULL,

  -- Common Fields
  [DateCreated] Date,
  [DateModified] Date,
  [DateDeleted] Date
);
GO

