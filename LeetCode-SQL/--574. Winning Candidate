--574. Winning Candidate

select Name
from Candidate
where id =
      (
          select top 1 CandidateId
          from Vote
          group by CandidateId
          order by count(CandidateId) desc
          );