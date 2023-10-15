
--Tasks to be performed: 

--1. Find out the selling cost AVG for packages developed in Pascal. 
select avg(scost) from software where DEVELOPIN='pascal'

--2. Display Names, Ages of all Programmers. 
select pname, 
DATEDIFF(yy,dob,getdate()) as Age
FROM 
programmer

--3. Display the Names of those who have done the DAP Course. 
select pname from studies where COURSE='DAP'

--4. Display the Names and Date of Births of all Programmers Born in January. 
SELECT pname, DOB from programmer where month(dob)=1

--5. What is the Highest Number of copies sold by a Package? 
select max(sold) from software

--6. Display lowest course Fee. 
select min(course_fee) from studies

--7. How many programmers done the PGDCA Course? 
select count(course) from studies where course='PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.
select sum(scost*sold) as Revenue_C from software where DEVELOPIN='C'

--9. Display the Details of the Software Developed by Ramesh. 
select * from software where pname='Ramesh'

--10. How many Programmers Studied at Sabhari? 
select count(institute) from studies where INSTITUTE='Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark. 
select * from software where scost*sold>2000

		--if the question meant just the selling cost, then:-
		select * from software where scost>2000

--12. Display the Details of Packages for which Development Cost have been recovered. 
select * from software where scost*sold>dcost

--13. What is the cost of the costliest software development in Basic? 
select max(dcost) from software where DEVELOPIN='BASIC'

--14. How many Packages Developed in DBASE? 
select count(*) from software where DEVELOPIN='dbase'

--15. How many programmers studied in Pragathi? 
select count(*) from studies where institute='PRAGATHI'

--16. How many Programmers Paid 5000 to 10000 for their course? 
select count(*) from studies where COURSE_FEE>=5000 and COURSE_FEE<=10000

--17. What is AVG Course Fee 
select avg(course_fee) from studies 

--18. Display the details of the Programmers Knowing C.
select * from programmer where PROF1='c' or PROF2='c'

--19. How many Programmers know either COBOL or PASCAL. 
select count(*) from programmer where PROF1='cobol' or PROF1='pascal' or PROF2='cobol' or PROF2='pascal'

--20. How many Programmers Don’t know PASCAL and C 
select count(*) from programmer where PROF1<>'c' and PROF1<>'pascal' and PROF2<>'c' and PROF2<>'pascal'

--21. How old is the Oldest Male Programmer. 
select max(DATEDIFF(yy,dob,getdate())) as Oldest_Age
FROM 
programmer
WHERE gender='m'

--22. What is the AVG age of Female Programmers? 
select AVG(DATEDIFF(yy,dob,getdate())) as AVG_Age
FROM 
programmer
WHERE gender='F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
select DATEDIFF(yy,doj,getdate()) as Experience, PNAME
FROM 
programmer
order by PNAME desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 

	--cuurent month = May 
select Pname from programmer where month(dob)=5

--25. How many Female Programmers are there? 
select count(*) from programmer where GENDER='f'

--26. What are the Languages studied by Male Programmers. 
select distinct PROF1  from programmer where GENDER='M'
select distinct PROF2 from programmer where GENDER='M'

--27. What is the AVG Salary? 
select avg(salary) from programmer

--28. How many people draw salary 2000 to 4000? 
select count(*) from programmer where salary>=2000 and salary<=4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
select * from programmer where PROF1 not in ('clipper', 'cobol', 'pascal') and PROF2 not in ('clipper', 'cobol', 'pascal')

--30. Display the Cost of Package Developed By each Programmer. 

	--for dcost and scost respectively, since it wasnt specified in question
select pname, sum(dcost) from software group by pname
select pname, sum(scost) from software group by pname

--31. Display the sales values of the Packages Developed by the each Programmer. 
select pname, sum(scost)*sum(sold) from software group by pname

--32. Display the Number of Packages sold by Each Programmer. 
select pname, sum(sold) from software group by pname

--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
select developin, sum(scost) from software group by developin

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
select developin, avg(dcost) AVG_DCOST, avg(scost) AVG_SCOST, avg(scost*sold) AVG_PERCOPY 
from software group by developin 

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
select Pname, max(dcost) MAX_DCOST, Min(dcost) MIN_DCOST 
from software group by pname

--36. Display each institute name with number of Courses, Average Cost per Course. 
select institute, count(course) course, avg(course_fee) avg_fee 
from studies
group by institute

--37. Display each institute Name with Number of Students. 
select Institute, count(pname) 'Number of Students'
from studies group by institute

--38. Display Names of Male and Female Programmers. Gender also. 
select Pname, gender from programmer 

--39. Display the Name of Programmers and Their Packages. 
select Pname, salary from programmer 

--40. Display the Number of Packages in Each Language Except C and C++. 
select developin, count(developin) 'No of Packages' 
from software where developin not in ('c' ,'c++')
group by DEVELOPIN

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select developin, count(developin) 'No of Packages' 
from software where dcost < 1000
group by DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package. 
select Title, avg(dcost-scost) 'AVG diferrence' 
from software 
group by title

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
select pname, sum(scost) 'Total Scost', sum(dcost) 'Total Dcost', sum(dcost-(scost*sold)) 'Amount to be recovered'
from software group by pname 
having sum(dcost)>sum(scost*sold)

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select max(salary) highest, min(salary) lowest, avg(salary) average
from programmer where SALARY>2000

--45. Who is the Highest Paid C Programmers? 
select pname from programmer where salary= (select max(salary) from programmer where prof1='c' or prof2='c')

--46. Who is the Highest Paid Female COBOL Programmer? 
select pname from programmer 
where salary= (select max(salary) from programmer where prof1='cobol' or prof2='cobol') and gender='f'

--47. Display the names of the highest paid programmers for each Language. 

create table #language_salary(
Prof varchar (20), 
Salary int)

insert into #language_salary
select prof1, max(salary) Max_Salary 
from programmer
group by prof1

insert into #language_salary
select prof2, max(salary) Max_Salary 
from programmer
group by prof2

create table #language_max_salary(
Prof varchar (20), 
Salary int)

insert into #language_max_salary
select Prof, max(salary) 
from #language_salary
group by prof

select pname, prof, m.salary
from programmer p
inner join #language_max_salary m
on prof=prof1 or prof=prof2 
where m.salary=p.salary
order by prof 

--48. Who is the least experienced Programmer. 
select pname, year(getdate())- year(DOJ) as 'experience' from Programmer
Where year(getdate())- year(DOJ)=(Select min(year(getdate())-year(DOJ)) from Programmer)

--49. Who is the most experienced male programmer knowing PASCAL. 
select top 1 pname, year(getdate())- year(DOJ) as 'experience' from Programmer
Where gender='m'
and prof1='pascal' or prof2='pascal' 
order by experience desc

--50. Which Language is known by only one Programmer? 
select prof1 from programmer 
group by prof1 
having prof1 not in (Select prof2 from programmer)
and count(prof1)=1 
	UNION
select prof2 from programmer 
group by prof2 
having prof2 not in (select prof1 from programmer) 
and count(prof2)=1

--51. Who is the Above Programmer Referred in 50? 
create table #plang(prof varchar(20))

insert into #plang
	select prof1 from programmer
	group by prof1 having
	prof1 not in (select prof2 from programmer)
	and count(prof1)=1
		UNION
	select prof2 from programmer
	group by prof2 having
	prof2 not in (select prof1 from programmer)
	and count(prof2)=1

select pname, prof 
from programmer 
inner join #plang 
on prof=prof1 or prof=prof2


--52. Who is the Youngest Programmer knowing DBASE? 
select top 1 pname, year(getdate())- year(DOB) as 'AGE' from Programmer
Where prof1='DBASE' or prof2='DBASE' 
order by AGE asc

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
select * from programmer where gender='F' and salary>3000 and 
prof1 not in ('c', 'c++', 'oracle', 'dbase') and prof2 not in ('c', 'c++', 'oracle', 'dbase')

--54. Which Institute has most number of Students? 
select top 1 INSTITUTE, count(pname) 'No. of Students' from studies
group by institute
order by INSTITUTE desc

--55. What is the Costliest course? 
select course, course_fee from studies 
where COURSE_FEE=(select max(course_fee) from studies)

--56. Which course has been done by the most of the Students? 
select top 1 course, count(pname) 
from studies
group by course
order by count(pname) desc

--57. Which Institute conducts costliest course. 
select top 1 institute, max(course_fee) 
from studies
group by institute
order by max(course_fee) desc

--58. Display the name of the Institute and Course, which has below AVG course fee. 
select institute, course, course_fee from studies 
where COURSE_FEE<(select avg(course_fee) from studies) 

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
select institute, course, course_fee from studies 
where COURSE_FEE<(select avg(course_fee)+1000 from studies )
and COURSE_FEE>(select avg(course_fee)-1000 from studies)

--60. Which package has the Highest Development cost? 
select top 1 Title, max(dcost) 
from software
group by title
order by max(dcost) desc 

--61. Which course has below AVG number of Students? 

create table #avgcount (
course varchar(20), 
student_count int)

insert into #avgcount
	select course, count(pname) 
	from studies 
	group by course

select course,student_count 
from #avgcount 
where student_count <=(select avg(student_count) from #avgcount)


--62. Which Package has the lowest selling cost? 
select top 1 title, scost from software
order by scost asc

--63. Who Developed the Package that has sold the least number of copies? 
select top 1 pname, title , sold from software
order by sold asc

--64. Which language has used to develop the package, which has the highest sales amount? 
select top 1 developin, sold from software
order by sold desc

--65. How many copies of package that has the least difference between development and selling cost where sold. 
select title, sold from software 
where dcost-scost = (select min(dcost-scost) from software)

--66. Which is the costliest package developed in PASCAL. 
select title, dcost from software where developin='pascal' 
and dcost=(select max(dcost) from software where DEVELOPIN='pascal')

--67. Which language was used to develop the most number of Packages. 
select top 1 developin, count(developin) from software 
group by developin
order by count(developin) desc

--68. Which programmer has developed the highest number of Packages? 
select top 1 pname, count(pname) from software 
group by pname
order by count(pname) desc

--69. Who is the Author of the Costliest Package? 
select pname, title, dcost from software 
where dcost=(select max(dcost) from software)

--70. Display the names of the packages, which have sold less than the AVG number of copies. 
select title, sold from software 
where sold<(select avg(sold) from software) 

--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
select pname, title from software 
where sold*scost>2*dcost

--72. Display the programmer Name and the cheapest packages developed by them in each language. 
select pname, title, developin, dcost from software 
where dcost in (select min(dcost) from software group by developin)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
select pname, developin from software 
where sold in (select min(sold) from software group by pname)
union
select pname, developin from software 
where sold in (select max(sold) from software group by pname)

--74. Who is the youngest male Programmer born in 1965? 
select pname, dob from programmer 
where dob = (select max(dob) from programmer where year(dob)=1965 and gender='m')

--75. Who is the oldest Female Programmer who joined in 1992?
select pname, doj from programmer 
where doj = (select min(doj) from programmer where year(doj)=1992 and gender='f')

--76. In which year was the most number of Programmers born. 
select top 1 year(dob), count(*) from programmer 
group by year(dob)
order by count(*) desc

--77. In which month did most number of programmers join? 
select top 1 month(doj) 'month' , count(*) 'no. of new programmers' 
from programmer 
group by month(doj)
order by count(*) desc

--78. In which language are most of the programmer’s proficient. 
create table #profcount (prof varchar(20), pcount int)

insert into #profcount
select prof1, count(prof1) from programmer group by prof1 
union all
select prof2, count(prof2) from programmer group by prof2


create table #profmax (profmax varchar(20), maxcount int)

insert into #profmax
	select prof, sum(pcount) 
	from #profcount group by prof

select profmax, maxcount from #profmax where maxcount =
(select max(maxcount) from #profmax)

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
select pname from programmer 
where gender= 'm' and salary<(select avg(salary) from programmer where gender='f') 

--80. Who are the Female Programmers earning more than the Highest Paid? 
select pname, salary from programmer 
where gender='f' and 
salary>(select max (salary) from programmer where gender='m')

--81. Which language has been stated as the proficiency by most of the Programmers? 
--- same as Ques 78

--82. Display the details of those who are drawing the same salary. 
select a.pname, a.salary 
from programmer a
inner join programmer b 
on a.salary= b.salary and a.pname<>b.pname
order by a.salary

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
select s.pname, title, developin, scost, dcost, sold
from software s
join programmer p
on p.pname=s.pname
where gender='m' and salary>3000

--84. Display the details of the packages developed in Pascal by the Female Programmers.
select s.pname, title, developin, scost, dcost, sold
from software s
join programmer p
on p.pname=s.pname
where gender='f' and developin='pascal'

--85. Display the details of the Programmers who joined before 1990. 
select * from programmer where year(DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
select s.pname, title, developin, scost, dcost, sold
from software s
join programmer p
on p.pname=s.pname
join studies x
on x.pname=s.pname
where gender='f' and developin='c' and institute='pragathi'
 ----OR
select sw.*, p.gender, st.institute 
from studies st, software sw, programmer p
where p.pname=sw.pname and st.pname=sw.pname 
and gender='f' and institute='pragathi' and developin='c'
------------no values found 


--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
select institute, count(title)'packages', count(sold) 'copies sold' , sum(sold*scost) 'Sales_value'
from software s
join studies st
on st.pname=s.pname
group by institute

--88. Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied. 

select s.*, institute
	from software s
	join programmer p
	on p.pname=s.pname
	join studies st
	on st.pname=s.pname
		where gender='m' and developin='dbase' 
		and
			institute=(select top 1 institute from studies 
			group by institute order by count(institute) desc )

--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
select s.pname, YEAR(dob), gender
from software s
join programmer p
on p.pname=s.pname
where  gender='m' and year(dob)<1965 or gender='f' and year(dob)>1975
----OR 
select s.*, year(dob),gender from programmer p,software s
where s.pname=p.pname 
and((gender='m' and year(dob)<1965) or (gender='f' and year(dob)>1975))

-------------------------------NO RESULTS

--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 
select s.pname, dob, title, developin, scost, dcost, sold
from software s
join programmer p
on p.pname=s.pname
where developin <> prof1 and developin <> prof2

--91. Display the details of the software developed by the male students of Sabhari. 
select s.pname, institute, title, developin, scost, dcost, sold
from software s
join programmer p
on p.pname=s.pname
join studies st
on st.pname=s.pname
where institute='Sabhari' and gender='m'

--92. Display the names of the programmers who have not developed any packages. 
select pname from programmer 
where pname not in (select pname from software)

--93. What is the total cost of the Software developed by the programmers of Apple? 
select sum(dcost) 'Total cost'
from software s
join studies st
on s.pname=st.pname
group by institute having institute='apple'

--94. Who are the programmers who joined on the same day? 
select p1.pname, p1.doj 
from programmer p1, programmer p2 
where p1.doj = p2.doj and p1.pname<>p2.pname

--95. Who are the programmers who have the same Prof2? 
select pname, prof2 from programmer
where prof2= any(select prof2 from programmer
group by prof2 having count(*) >1)

--96. Display the total sales value of the software, institute wise. 
select institute, sum(scost*sold) 'Total sales'
from software s
join studies st
on s.pname=st.pname
group by institute 

--97. In which institute does the person who developed the costliest package studied. 
select st.pname, institute
from studies st
join software s
on st.pname=s.pname
where dcost= any(select max(dcost) from software)

--98. Which language listed in prof1, prof2 has not been used to develop any package. 
select prof1 from programmer where prof1 not in (select developin from software)
union 
select prof2 from programmer where prof2 not in (select developin from software)

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select st.pname, course, salary
from studies st
join software s
on st.pname=s.pname
join programmer p
on p.pname=st.pname
where sold= any(select max(sold) from software)

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) avg_salary
from programmer p
join software s
on s.pname=p.pname
where scost*sold>50000

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select count(title)
from software s
join studies st
on st.pname = s.pname
where course_fee = (select min(COURSE_FEE) from studies)

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 

select abc.*, st.institute 
from studies as st 
inner join
	(
	select sw.pname, count(title) as sw_count
	from software as sw
	where sw.pname = 
		(select pname from software 
		where dcost = (select min(dcost) from software)
		)
	group by sw.pname
	) as abc
on st.pname= abc.pname

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select count(title) from software s
join programmer p
on s.pname=p.pname
where gender='f' 
and salary>(select max(salary) from programmer where gender='m')

--104. How many packages are developed by the most experienced programmer form BDPS. 
select count(title) from software 
where pname=
	(select p.pname , doj from programmer as p 
	where datediff(dd,doj, getdate()) = 
		(select max(datediff(dd,doj,getdate()))
		from programmer p, studies st
		where p.pname=st.pname 
		and p.pname in (select pname from studies where institute='bdps'))

--105. List the programmers (form the software table) and the institutes they studied. 
select distinct s.pname, institute
from software s
join  studies st
on st.pname=s.pname

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 

select p.prof1, p.prof2, count(distinct p.pname) 'prog_count', count(s.title) as 'package_count'
from programmer p
left join software s
on p.pname=s.pname
group by prof1, prof2


--107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 
select p.pname, count(title) 'No. of Packages'
from programmer p
join  software s
on p.pname=s.pname
group by p.pname
