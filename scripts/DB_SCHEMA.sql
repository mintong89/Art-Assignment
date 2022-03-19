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
  [UserProfilePicture] varchar(255),
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
  [ContactPhone] varchar(255),
  [ContactEmail] varchar(255),
  [ContactTwitter] varchar(255),
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
  [Price] float NOT NULL,
  [ArtPicture] varchar(255),
  [IsSold] BIT NOT NULL DEFAULT 0,
  
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
  [DeliveryFee] float,
  [TaxFee] float,
  [Status] varchar(255) NOT NULL,	

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

CREATE TABLE [dbo].[CartItem] (
    [UserID]    INT NOT NULL,
    [ArtProdID] INT NOT NULL,
    CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED ([UserID] ASC, [ArtProdID] ASC),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([ID]),
    FOREIGN KEY ([ArtProdID]) REFERENCES [dbo].[ArtProd] ([ID])
);
GO

CREATE TABLE [dbo].[WishlistItem] (
    [UserID]    INT NOT NULL,
    [ArtProdID] INT NOT NULL,
    CONSTRAINT [PK_WishlistItem] PRIMARY KEY CLUSTERED ([UserID] ASC, [ArtProdID] ASC),
    CONSTRAINT [COM_K_UserID] FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [COM_K_ArtProdID] FOREIGN KEY ([ArtProdID]) REFERENCES [dbo].[ArtProd] ([ID])
);
GO

INSERT INTO [User](Password, Email, DateCreated, DateModified)
VALUES (
  'zpBd0M3yJboQo7Ft2pIqstHunFLRjQEVzVj/M51Z8FS9h0jI',
  'user@gmail.com',
  GETDATE(),
  GETDATE()
);
GO

INSERT INTO [Artist](Name, Rating, UserID, DateCreated, DateModified)
VALUES (
  'Leonardo da Vinci',
  0,
  1,
  GETDATE(),
  GETDATE()
);
GO

INSERT INTO ArtProd ([Name],[Description],[ArtistOwner],[Price],[DateCreated],[DateModified])
VALUES 
	('Mona Lisa','Description for Mona Lisa',1,'237.30',getDate(),getDate()),
	('Salvator Mundi','Description for Salvator Mundi',1,'689.40',getDate(),getDate()),
	('The Last Supper','Description for The Last Supper',1,'579.86',getDate(),getDate()),
	('Lady with an Ermine','Description for Lady with an Ermine',1,'123.00',getDate(),getDate()),
	('Vitruvian Man','Description for Vitruvian Man',1,'297.90',getDate(),getDate()),
	('Virgin of the Rocks','Description for Virgin of the Rocks',1,'305.64',getDate(),getDate());
GO