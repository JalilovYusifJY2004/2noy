CREATE DATABASE Noyabr2

USE Noyabr2

CREATE TABLE Users(
Id int primary key identity,
[Name] varchar(25) not null,
Surname varchar(25) not null,
Username varchar(25) unique,
[Password] varchar(25) not null,
Gender varchar(25) not null
)


CREATE TABLE Artists(
Id int primary key identity,
[Name] varchar(25) not null,
Surname varchar(25) not null,
Birthday datetime,
Gender varchar(25)
)

CREATE TABLE Categories(
Id int primary key identity,
[Name] varchar(25) not null
)

CREATE TABLE Musics(
Id int primary key identity,
[Name] varchar(25) not null,
Duration int,
CategoryID int foreign key references Categories(Id),
AristID int foreign key references Artists(Id)
)

CREATE TABLE Playlists(
Id int primary key identity,
UserID int foreign key references Users(Id),
MusicID int foreign key references Musics(Id)
)

CREATE VIEW GetsongsDetails 
AS
SELECT
M.Name AS MusicName,
M.Duration,
C.Name AS CategoryName,
A.Name+''+A.Surname AS ArtistName,
A.Surname AS ArtistSurname
FROM Musics M
 JOIN Categories C ON M.CategoryID = C.Id
join Artists A ON M.AristID = A.Id;

SELECT *FROM GetsongsDetails

CREATE PROCEDURE usp_CreateMusic
(
    @Name VARCHAR(25),
    @Duration int
   
)
AS
BEGIN
    INSERT INTO Musics(Name,Duration)
    VALUES (@Name, @Duration);
END;

CREATE PROCEDURE usp_CreateUser
(
    @Username VARCHAR(25)
   
)
AS
BEGIN
    INSERT INTO Users(Username)
    VALUES (@Username);
END;


CREATE PROCEDURE usp_CreateCategory
(
    @Name VARCHAR(25)
   
)
AS
BEGIN
    INSERT INTO Categories(IName)
    VALUES (@Name);
END;

ALTER TABLE Users ADD IsDeleted2 BIT NOT NULL