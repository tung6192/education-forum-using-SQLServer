Use EducationSocialNetwork

Insert into Person (Name, DateOfBirth, Gender, Email, Phone)
Values
('Hai Hau', '4/3/1998', 'Male', 'hai.hau@gmail.com', 98271819),
('Van Chuyen', '3/6/1994', 'Male', 'van.chuyen@gmail.com', 2918210),
('Hoai Duc', '2/16/1997', 'Male', 'hoai.duc@gmail.com', 1627638281),
('Hoa Thu', '3/26/1992', 'Female', 'hoa.thu@gmail.com', 293272937),
('Thai Ha', '6/22/1997', 'Female', 'thai.ha@gmail.com',2738292),
('Pham Ngoc', '7/5/1993', 'Else', 'ngoc.pham@gmail.com', 17261827),
('Quoc Huy', '1/21/1987', 'Male', 'huy.quoc@gmail.com',172939283),
('Thu Huong', '5/6/1989', 'Female', 'huong.thu@gmail.com', 9873618),
('Nguyen Dinh Tung', '1/6/1992', 'Male', 'tung1s23@gmail.com', 9327282)

Insert into Subject(Subject, Description)
Values
('Mathematics', 'Strengthen logical thinking'),
('Literature', 'Understand and show sympathy with other people'),
('English', 'Able to communicate with people all around the world')


Insert into Question(Title, Body, PlusScore, SubjectID, PersonID)
Values
('What is parabol', 'I dont understand textbook definition, someone helps me', 2, 1, 3),
('How to self-study English', 'I try to study English for 3 years but unsuccessful, is there any suggestion?', 10, 3, 2),
('Why the answer of 2 + 3 x 2 = 8, should be 10?','',5, 1, 3),
('Difference between line and curve?', 'My textbook is old, I cant see the image', 9, 1, 5)

Insert into Answer(Answer, PlusScore, QuestionID, PersonID)
Values
('Can u upload the picture', 2, 3, 4),
('See the following link: sefa.edu.vn', 3, 1, 6),
('Dont learn by heart, understand the structure first, and imitate', 4, 1, 9),
('Listen, Speak, Read, then Write. That is the correct answer to learn language', 7, 1, 8),
('remember the calcualtion order: x is before +', 5, 2, 6),
('Complete agreed', 1, 2, 9),
('Line is straigh, curve is not straight', 2, 3, 7),
('I can bring my book for you tmr', 2, 3, 3)

Insert into School (SchoolName, Address)
Values
('THCS Tran Phu', 'Ba Dinh, Ha Noi'),
('THCS Truong VUong', 'Hai Ba Trung, Ha Noi'),
('THCS Hoang Liet', 'Hoang Mai, Ha Noi')

Insert into Teacher (PersonID, Position, SchoolID, SubjectID)
Values
(7, 'Vice President', 1, 3),
(8, 'Full time', 3, 1)

Insert into CompanyRep(PersonID, Position, CompanyName)
Values
(6, 'Operation Manager', 'Sapp Academy'),
(9, 'Head of Education', 'FPT Software')

Insert into Student(PersonID, Class, SchoolID)
Values
(1, '9A3', 1),
(2, '8E1', 3),
(3, '9A2', 1),
(4, '6E3', 2),
(5, '7A3', 2)

Insert into SpecializedIn(PersonID, SubjectID)
Values
(6, 1),
(6, 3),
(9, 1),
(9, 2),
(9, 3)