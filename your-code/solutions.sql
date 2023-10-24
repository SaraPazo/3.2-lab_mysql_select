-- Challenge 1 - Who Have Published What At Where?

select a.au_id as `Author ID`,
		a.au_lname as `Last Name`,
		a.au_fname as `First Name`,
        p.pub_name as `Publisher`,
		t.title as `Title`,
        p.pub_name as `Publisher`

from titleauthor as ta
left join titles as t
on ta.title_id = t.title_id
left join authors as a
on ta.au_id = a.au_id
left join publishers as p
on t.pub_id = p.pub_id



-- Challenge 2 - Who Have Published How Many At Where?

select a.au_id as `Author ID`,
		a.au_lname as `Last Name`,
		a.au_fname as `First Name`,
        p.pub_name as `Publisher`,
		count(t.title) as `Title Count`

from titleauthor as ta
left join titles as t 
on ta.title_id = t.title_id
left join authors as a
on ta.au_id = a.au_id
left join publishers as p
on t.pub_id = p.pub_id

GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
order by `Title Count` DESC



-- Challenge 3 - Best Selling Authors

select a.au_id as `Author ID`,
		a.au_lname as `Last Name`,
		a.au_fname as `First Name`,
        SUM(s.qty) as `Total Sales`

from titleauthor as ta
left join titles as t 
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
left join authors as a
on ta.au_id = a.au_id

GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY `Total Sales` DESC
LIMIT 3



-- Challenge 4 - Best Selling Authors Ranking

select a.au_id as `Author ID`,
		a.au_lname as `Last Name`,
		a.au_fname as `First Name`,
        COALESCE(SUM(s.qty), 0) AS `Total Sales`
        
from titleauthor as ta
left join titles as t 
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id
left join authors as a
on ta.au_id = a.au_id

GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY `Total Sales` DESC;



