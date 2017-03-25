/* 
Liệt kê tất cả câu hỏi và câu trả lời, dù câu hỏi đã được trả lời hay chưa
*/
Select Title, Answer
From Question
Left Outer Join Answer
On Question.QuestionID = Answer.QuestionID