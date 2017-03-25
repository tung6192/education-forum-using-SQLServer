/*
Chọn tên, Email của 
	- tất cả học sinh
	- là nam
	- email bắt đầu bằng chữ "ha" hoặc "va"
*/
Use EducationSocialNetwork 
Select Person.Name, Email
From Person, Student
Where (Person.PersonID = Student.PersonID) And
	  (Gender='Male') And
	  ((Email Like 'ha%') Or (Email Like 'va%'))

