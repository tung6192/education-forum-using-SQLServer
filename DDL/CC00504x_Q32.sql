/* 
Lọc và sắp xếp tất cả câu trả lời của đại diện công ty
theo số điểm giảm dần
*/
Select Answer.Answer, PlusScore
From Answer
Inner Join CompanyRep
On CompanyRep.PersonID = Answer.PersonID
Order by Answer.PlusScore DESC
