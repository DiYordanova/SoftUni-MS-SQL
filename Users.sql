CREATE TABLE Users(
    Id BIGINT PRIMARY KEY IDENTITY NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX)
	CHECK (DATALENGTH(ProfilePicture) <= 900 * 1024),
	LastLoginTime DATETIME2 NOT NULL,
	IsDeleted BIT NOT NULL
	)

INSERT INTO Users(Username, [Password], LastLoginTime, IsDeleted)
     VALUES
	 ('Pesho1', '123456', '05.16.2021', 0),
	 ('Pesho2', '123456', '05.16.2021', 1),
	 ('Pesho3', '123456', '05.16.2021', 0),
	 ('Pesho4', '123456', '05.16.2021', 0),
	 ('Pesho5', '123456', '05.16.2021', 1)

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07F885EAB0

ALTER TABLE Users
ADD CONSTRAINT PK_Users_CompositeIdUsername
PRIMARY KEY (Id, Username)
	
ALTER TABLE Users
ADD CONSTRAINT CK_Users_PasswordLength
CHECK (LEN([Password]) >= 5)

ALTER TABLE Users
ADD CONSTRAINT DF_Users_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users
DROP CONSTRAINT PK_Users_CompositeIdUsername

ALTER TABLE Users
ADD CONSTRAINT PK_Users_Id
PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT CK_Users_UserNameLength
CHECK(LEN(Username)  >= 3)

SELECT * FROM Users