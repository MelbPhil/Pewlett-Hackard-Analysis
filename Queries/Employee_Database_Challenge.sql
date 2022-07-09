-- Number of Retiring Employees by Title.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

-- Number of employees (most recent title) about to retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Create a Mentorship Eligibility table.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- CREATION OF STATS BEYOND SCOPE OF ASSIGNMENT

-- Mentorship Eligibility Total
SELECT COUNT(me.title)
FROM mentorship_eligibility as me;

-- Mentorship Eligibility by Title
SELECT COUNT(me.title), me.title
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY COUNT(me.title);

-- Mentorship Eligibility table including dept names
SELECT DISTINCT ON (me.emp_no)
	me.emp_no,
	me.first_name,
	me.last_name,
	me.from_date,
	d.dept_name
INTO eligible_mentors_w_depts
FROM mentorship_eligibility as me
LEFT JOIN dept_emp as de
ON (me.emp_no = de.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY me.emp_no;

-- Eligible mentors by depts
SELECT COUNT(embd.dept_name), embd.dept_name
FROM eligible_mentors_w_depts as embd
GROUP BY embd.dept_name
ORDER BY COUNT(embd.dept_name) DESC;

-- Number of Retiring Employees by dept.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date,
	d.dept_name
INTO retirement_depts
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT COUNT(rd.dept_name), rd.dept_name
INTO retiring_depts
FROM retirement_depts as rd
GROUP BY rd.dept_name
ORDER BY COUNT(rd.dept_name) DESC;