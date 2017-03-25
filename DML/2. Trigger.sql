Use EducationSocialNetwork
Go
/*Ngoài việc khen thưởng theo tháng với những thành viên tích cực,
mạng xã hội cho phép khen thưởng theo số điểm tích lũy thành từng level.
Bất cứ thành viên nào đạt từ 10 điểm trở lên sẽ qua level 1.
Trigger tạo ra khi 1 câu hỏi hay 1 câu trả lời đc lập để tính điểm bạn đó, 
và thông báo bạn đó có được lên level hay không.
Ví dụ dưới đây là trigger tạo ra khi 1 ai đó đặt câu hỏi trên diễn đàn*/
Create Trigger Notify
On Question
After Insert
As
Begin
	
	Declare @Id int
	Select @Id = PersonID from inserted
	If (
			(Select SUM(PlusScore)
				From (
					/*Liệt kê các điểm số trong bảng Answer*/
					(Select PersonID, Answer, PlusScore
					From Answer
					Where Answer.PersonID = @Id)
					Union All
					/*Liệt kê các điểm số trong bảng Question*/
					(Select PersonID, Title, PlusScore
					From Question
					Where Question.PersonID = @Id)
				) as ListOfScore
				Group by ListOfScore.PersonID
			) > 9
		)
	print 'The student should be rewarded at level 1'
End

/*Ví dụ thử nghiệm*/
Go
Insert into Question(Title, Body, PlusScore, SubjectID, PersonID)
Values
('Differences between Empathy and Sympathy?', '', 3, 3, 3)