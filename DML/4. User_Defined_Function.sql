Use EducationSocialNetwork
Go
Create Function PlusScoreGreaterThan
(
	@Score int
)
Returns @t Table
(
	Type nvarchar(10),
	Content nvarchar(200),
	PlusScore int
)
As

Begin
	Insert into @t
	Select 'Question',Title, PlusScore
	From Question
	Where PlusScore > @Score

	Insert into @t
	Select 'Answer',Answer, PlusScore
	From Answer
	Where Answer.PlusScore > @Score

	Return
End

/*
Đây là function thuộc dạng multi-statement table-valued function,
cho phép trả dữ liệu, là dữ liệu được tập hợp từ nhiều select statement.

Mục đích của function là tìm kiếm tất cả các câu hỏi, hoặc câu trả lời,
có số điểm thưởng lớn hơn một giá trị cho trước

Vì các giá trị cần tiềm ở cả bảng câu hỏi và bảng câu trả lời, ta dùng
multi-statement table-valued function
*/

/*Ví dụ*/
Go
Select * From PlusScoreGreaterThan(4)