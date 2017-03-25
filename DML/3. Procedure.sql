/*Level các thành viên dựa trên tổng số điểm mà thành viên đó tích lũy được.
Procedure dưới đây cho phép lọc các thành viên với điểm số năm trong 1 khoảng giá trị*/
Use EducationSocialNetwork
Go
Create Proc CheckLevel
(
@Level As int = null
)
As

Begin
	Declare @LowLevel as int, @HighLevel as int
	If (@Level=1)
		Begin
			Set @LowLevel = 10
			Set @HighLevel = 15
		End
	If (@Level=2)
		Begin
			Set @LowLevel = 16
			Set @HighLevel = 30
		End
	If (@Level = 3)
		Begin
			Set @LowLevel = 31
			Set @HighLevel = 50
		End
	Select PersonID, Name, SUM(TotalScore.PlusScore) TotalScore
		From (
			/*Liệt kê điểm số đặt câu hỏi*/
			(Select Person.PersonID, Name, PlusScore
			From Question Inner Join Person
			On Question.PersonID = Person.PersonID)
			Union All
			/*Liệt kê điểm số trả lời câu hỏi*/
			(Select Person.PersonID, Name, PlusScore
			From Answer Inner Join Person
			On Answer.PersonID = Person.PersonID)
			) as TotalScore
		Group by TotalScore.PersonID, TotalScore.Name
		Having SUM(TotalScore.PlusScore)>=@LowLevel And
			   SUM(TotalScore.PlusScore)<=@HighLevel
End

/*Ví dụ: lọc các thành viên level 1: điểm tích lũy từ 10 đến 15*/
Go
Exec CheckLevel @Level=1

/*
Lợi ích của việc dùng store procedures:
- Có thể có biến số, dữ liệu có thể trích xuất linh động dựa vào thay đổi biến
- Dễ bảo trì, có thể thay đổi logic của procedure mà không ảnh hướng tới app dùng dữ liệu
- Có thể dùng nhiều cú pháp như if, else, while, case...
- Có thể chỉnh sửa 1 hoặc nhiều bảng cùng lúc
- Thường procedure sẽ được lưu trữ nên những lần sử dụng sau này sẽ không cần load lại nữa
*/