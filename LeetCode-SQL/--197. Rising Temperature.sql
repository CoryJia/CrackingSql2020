--197. Rising Temperature

select w2.Id
from Weatehr w1,
     Weather w2
where w2.Temperature > w1.Temperature
  and w2.RecordDate = dateadd(dd, 1, w1.RecordDate);

