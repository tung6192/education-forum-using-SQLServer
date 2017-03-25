/* Tính tổng điểm mà mỗi người có khi tham gia đặt và trả lời câu hỏi */

Use EducationSocialNetwork
Select Name, SUM(PlusScoreTable.PlusScore) From 
(
	/*Lap bang PlusScore cho cau hoi*/
	(Select Name,PlusScore
	From Person
	Inner Join Question
	On Person.PersonID = Question.PersonID)

	Union

	/*Lap bang PlusScore cho cau tra loi*/
	(Select Name, PlusScore
	From Person
	Inner Join Answer
	On Person.PersonID = Answer.PersonID)
) as PlusScoreTable
Group by PlusScoreTable.Name