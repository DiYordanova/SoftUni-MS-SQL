CREATE DATABASE Movies 

USE Movies

CREATE TABLE Directors(
       Id INT PRIMARY KEY IDENTITY NOT NULL,
	   DirectorName VARCHAR(20) NOT NULL,
       Notes NVARCHAR(20)
)

CREATE TABLE Genres(
       Id INT PRIMARY KEY IDENTITY,
	   GenreName NVARCHAR(20) NOT NULL,
       Notes NVARCHAR(20)
)

CREATE TABLE Categories (
       Id INT PRIMARY KEY IDENTITY,
	   CategoryName CHAR(1) NOT NULL,
       Notes NVARCHAR(20)
)

CREATE TABLE Movies(
       Id INT PRIMARY KEY IDENTITY,
	   Title NVARCHAR(20) NOT NULL,
       DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	   CopyrightYear INT NOT NULL,
       [Length] INT NOT NULL,
       GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	   CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	   Rating INT NOT NULL,
	   Notes NVARCHAR(50)
)

INSERT INTO Directors(DirectorName)
     VALUES
	        ('Ivanov'),
			('Georgiev'),
			('Minev'),
			('Fotev'),
			('Manolov')

INSERT INTO Genres(GenreName)
     VALUES
	        ('Drama'),
			('Romantic'),
			('Comedy'),
			('Fantacy'),
			('Horrors')

INSERT INTO Categories(CategoryName)
     VALUES
	        ('A'),
			('B'),
			('C'),
			('A'),
			('C')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length] , GenreId, CategoryId, Rating)
     VALUES
	        ('Friends', 4, '1999', '100', 3, 1, '50'),
			('Dark blue', 2, '2000', '120', 2, 2, '30'),
			('Don Jon', 3, '1997', '90', 4, 5, '60'),
			('Hollywood', 1, '2004', '90', 5, 2, '85'),
			('Donkey Hote', 5, '2008', '100', 1, 3, '28')

	