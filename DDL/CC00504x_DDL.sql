Create database EducationSocialNetwork
Go

Use EducationSocialNetwork
Go
Create table Person 
(
PersonID int primary key identity(1,1) NOT NULL,
Name nvarchar(50) NOT NULL,
DateOfBirth date,
Gender nvarchar(10) check(Gender In ('Male','Female','Else')),
Email nvarchar(50) unique NOT NULL,
Phone int
);

Create table Subject
(
SubjectID int primary key identity(1,1) not null,
Subject nvarchar(50) unique not null,
Description nvarchar(300) 
)

Create table Question
(
QuestionID int primary key identity(1,1) not null,
Title nvarchar(200) not null,
Body nvarchar(max),
PlusScore int not null default(5),
SubjectID int foreign key references Subject(SubjectID),
PersonID int foreign key references Person(PersonID)
)

Create table Answer
(
AnswerID int primary key identity(1,1) not null,
Answer nvarchar (max) not null,
PlusScore int not null default(2),
QuestionID int foreign key references Question(QuestionID),
PersonID int foreign key references Person(PersonID)
)

Create table School
(
SchoolID int primary key identity(1,1) not null,
SchoolName nvarchar(100) not null,
Address nvarchar(200)
)

Create table Teacher
(
PersonID int foreign key references Person(PersonID),
Position nvarchar(50),
SchoolID int foreign key references School(SchoolID),
SubjectID int foreign key references Subject(SubjectID)
)

Create table CompanyRep
(
PersonID int foreign key references Person(PersonID),
Position nvarchar(50),
CompanyName nvarchar(50) not null
)

Create table Student
(
PersonID int foreign key references Person(PersonID),
Class nvarchar(10),
SchoolID int foreign key references School(SchoolID),
)

Create table SpecializedIn
(
PersonID int foreign key references Person(PersonID),
SubjectID int foreign key references Subject(SubjectID)
)

