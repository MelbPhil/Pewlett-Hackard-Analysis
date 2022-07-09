# Pewlett-Hackard-Analysis
Building an employee database with SQL and reviewing retirement data.

## Overview of PH Analysis
I conducted a preliminary analysis on the Pewlett-Hackard database, finding the number of employees that might be retiring soon from each department, a list of retiring managers from each department, and a list of employees from specifically sales, as well as sales and development departments.

A few notable insights on the preliminary analysis:
    - It seems salaries were never adjusted for most employees. Assuming that the company did infact give raises to its employees, perhaps this signifies that raises were tracked elswehere. This is a red flag that must be reconciled.
    - According to the spreadsheets, there are only five active managers, whereas the company has a total of nine departments. This is yet another sign that the company records might be outdated. 
    - When breaking down retirees by deparment, some employees are appearing twice. Does this signify that these employees switched departments during their time at the company?

Following the above analysis, I was then tasked with reviewing the number of retiring employees by title, and identifies employees that are elibile to participate in the new mentorship program. The following reviews the result of that analysis.

## Resources
- Data Sources: departments.csv, 
    dept_emp.csv, dept_manager.csv, 
    employees.csv, salaries.csv, titles.csv
- Software: PostgreSQL 11.16, pgAdmin 6.11

## PH Analysis Results
- Retiring titles:
[Image]:Retiring_Titles...

    - As discernable in the image above, the vast majority of soon-to-be retiring remployees (_born between 1952 and 1955_) are Senior Engineers and Senior Staff, and two Managers are included on the list as well. All of this signifies that the compnay must ensure that they plan ahead by either training young employees or start looking to hire outside talent to fill these pivotal positions.

- Employees Eligible for the Menotorship Program:


## PH Analysis Summary
According to the SQL code
'''
SELECT COUNT(ut.title)
FROM unique_titles as ut
'''
72,458 employees are likely going to be retiring in the coming years. Whereas based on the criteria provided by PH, only 1549 current employees eligible for the company's new mentorship program. 

(_mentor candidates by title_)                  (_mentor candidates by department_)
[Image of eligible employees by title][Image of eligible employees by department]

The tables above display the distribution of current employees that are elibile for participating in the mentorship program, onboarding the next generation of senior staff. When comparing these lists of mentors with the breakdown on soon-to-be retiring employees, its clear that PH will likely need to widen its criteria for eligible mentors.

(_retiring employees by title_)                 (_retiring employees by department_)