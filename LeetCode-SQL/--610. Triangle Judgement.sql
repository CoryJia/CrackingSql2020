--610. Triangle Judgement

select x, y, z,
       iif(x + y > z and x + z > y and y + z > x, 'Yes', 'No') as triangle
from triangle