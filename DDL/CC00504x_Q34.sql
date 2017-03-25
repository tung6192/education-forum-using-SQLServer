/* Tìm tất cả câu hỏi có trên 2 câu trả lời*/
Select Title, COUNT(*) NumberOfAnswer
From (Select Title
	  From Question, Answer
	  Where Question.QuestionID = Answer.QuestionID) as MatchAnswer
Group by MatchAnswer.Title
Having COUNT(*)>2