Use EducationSocialNetwork
Go
/*Một trong những mục tiêu của mạng xã hội về giáo dục là khả năng khuyến khích,
ghi nhận đóng góp của mọi người => việc tìm ra những người tích cực tham gia 
các hoạt động trên diễn đàn để khen thưởng là cần thiết.
Đồng thời, điểm đóng góp cần được chia theo các nhóm khác nhau: học sinh, giảng viên...
View dưới đây cho phép liệt kê tổng điểm của từng bạn học sinh*/
Create view StudentTotalScore As
Select Student.PersonID, Name, Class, SchoolID, TotalScore
From	(Select PersonID, Name, SUM(TotalScore.PlusScore) TotalScore
		From (
			/*Liệt kê điểm số đặt câu hỏi*/
			(Select Person.PersonID, Name, PlusScore
			From Question Inner Join Person
			On Question.PersonID = Person.PersonID)
			Union
			/*Liệt kê điểm số trả lời câu hỏi*/
			(Select Person.PersonID, Name, PlusScore
			From Answer Inner Join Person
			On Answer.PersonID = Person.PersonID)
			) as TotalScore
		Group by TotalScore.PersonID, TotalScore.Name) as SumupTable, Student
/*Lọc những bạn học sinh trong bảng total score*/
Where SumupTable.PersonID = Student.PersonID

Go
/*Sau khi đã tìm được tổng điểm của từng bạn học sinh, chúng ta tùy vào chính sách
để tìm ra những bạn cao điểm nhất và khen thưởng. Trong query dưới đây, ta tìm 2 bạn
có điểm số cao nhất*/
Select top 2 PersonID, Name, Class, SchoolName, TotalScore
From StudentTotalScore, School
Where School.SchoolID = StudentTotalScore.SchoolID
Order by TotalScore DESC