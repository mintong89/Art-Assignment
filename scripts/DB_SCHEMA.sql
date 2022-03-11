USE ArtDB;
GO

DROP TABLE IF EXISTS [dbo].[ArtProd];
GO

DROP TABLE IF EXISTS [dbo].[User];
GO

CREATE TABLE [dbo].[User] (
  [ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [IsActive] BIT,
  [Name] varchar(255),
  [Password] varchar(255) NOT NULL,
  [FirstName] varchar(255),
  [LastName] varchar(255),
  [Email] varchar(255) NOT NULL,
  [Description] varchar(255),
  [DateBirth] Date, --This one suppose to be enter by user

  -- Common Fields
  [DateCreated] DateTime,
  [DateModified] DateTime,
  [DateDeleted] DateTime,
  CONSTRAINT FirstName CHECK (FirstName NOT LIKE '% [^A-Z] % ]'), 
  CONSTRAINT LastName CHECK (LastName NOT LIKE '% [^A-Z] % ]')
);
GO

DROP TABLE IF EXISTS [dbo].[Artist];
GO

CREATE TABLE [dbo].[Artist] (
  [ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] varchar(255) NOT NULL,
  [BioDesc] varchar(255),
  [Rating] int,
  [ArtistProfilePicture] varchar(255),
  [UserID] int NOT NULL,

  -- Common Fields
  DateCreated DateTime,
  DateModified DateTime,
  DateDeleted DateTime,
  CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[User](ID)
);
GO

CREATE TABLE [dbo].[ArtProd] (
  [ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255),
  [ArtistOwner] int NOT NULL,
  
  -- Common Fields
  [DateCreated] DateTime,
  [DateModified] DateTime,
  [DateDeleted] DateTime,
  CONSTRAINT FK_ArtistOwner FOREIGN KEY (ArtistOwner) REFERENCES [dbo].[Artist](ID)
);
GO

DROP TABLE IF EXISTS [dbo].[Order];
GO

CREATE TABLE [dbo].[Order] (
  [ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Address1] varchar(255) NOT NULL,
  [Address2] varchar(255) NOT NULL,
  [State] varchar(255) NOT NULL,
  [Country] varchar(255) NOT NULL,
  [OrderTotal] float NOT NULL,
  [OrderMadeBy] int NOT NULL,
  [DeliveryFee] int,

  -- Common Fields
  [DateCreated] DateTime,
  [DateModified] DateTime,
  [DateDeleted] DateTime,
  CONSTRAINT FK_OrderMadeBy FOREIGN KEY (OrderMadeBy) REFERENCES [dbo].[User](ID)
);
GO

DROP TABLE IF EXISTS [dbo].[OrderItem];
GO

CREATE TABLE [dbo].[OrderItem] (
  OrderID int NOT NULL,
  ArtItemID int NOT NULL,
  CONSTRAINT COM_K_OrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[Order](ID),
  CONSTRAINT COM_K_ArtItemID FOREIGN KEY (ArtItemID) REFERENCES [dbo].[ArtProd](ID), 
  CONSTRAINT [PK_OrderItem] PRIMARY KEY ([ArtItemID], [OrderID])
);
GO

DROP TABLE IF EXISTS [dbo].[Payment];
GO

CREATE TABLE [dbo].[Payment] (
  [ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Status] varchar(255) NOT NULL,
  [PaymentMethod] varchar(255) NOT NULL,
  [PaymentAmount] float,
  [OrderID] int NOT NULL,
  -- Common Fields
  [DateCreated] DateTime,
  [DateModified] DateTime,
  [DateDeleted] DateTime,

  CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[Order](ID)
);
GO

