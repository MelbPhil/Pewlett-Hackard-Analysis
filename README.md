# Pewlett-Hackard-Analysis
Building an employee database with SQL and reviewing retirement data.

## Overview of PH Analysis
I conducted a preliminary analysis on the Pewlett-Hackard database, finding the following: the number of employees that might be retiring soon from each department, a list of retiring managers from each department, and a list of employees retiring from specifically the sales department, as well as the employees retiring from both sales and development.

A few notable insights on this preliminary analysis:

- According to the data salaries were never adjusted for most employees. Assuming that the company did infact give raises to its employees over the years, perhaps this signifies that raises were untracked, or recorded elsewhere. This is a red flag that must be reconciled as it points to faulty data.
- According to the spreadsheets, there are only five active managers, whereas the company has a total of nine departments. This is yet another sign that the company records might be outdated.
- When breaking down retirees by deparment, some employees are appearing twice. Does this signify that these employees switched departments during their time at the company?

After completing the above analysis, I was then tasked with reviewing the number of retiring employees by title, and identifies employees that are elibile to participate (as mentors) in PH's new mentorship program. The following reviews the result of that analysis.

## Resources
- Data Sources: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: PostgreSQL 11.16, pgAdmin 6.11

## PH Analysis Results
- Retiring titles:

    ![retiring_titles](https://user-images.githubusercontent.com/106599446/178111267-d06e687f-66cb-44f2-9ad9-b31b2ec6065b.png)

As discernable in the image above, the vast majority of soon-to-be retiring remployees (_born between 1952 and 1955_) are Senior Engineers and Senior Staff. Two Managers are included on this list as well. With a significant amount of high impact employees gearing up to leave the company, PH must be sure that they have a strategy in place for onboarding new leaders.

- Employees Eligible for the Menotorship Program:

    ![Eligible_Mentors_By_Title](https://user-images.githubusercontent.com/106599446/178111291-a4f7f7f3-e8e2-45a3-9c7f-837cab458d47.png)

When reviewing the breakdown of eligible mentors for PH's mentorship program, it seems less likely that their mentorship program will succeed in replacing the staff that's about to be leaving. The discrepancy between mentors caring specific titles, and soon-to-be available titles is vast. Depending on the rate at which employees retire, mentors would need to be able to handle possibly hundres of mentees each for this program to be successful in transitioning leadership effectively.

## PH Analysis Summary
According to the following SQL code:
````
SELECT COUNT(ut.title)
FROM unique_titles as ut;
````
72,458 employees are likely going to be retiring in the coming years. Whereas based on the criteria provided by PH, only 1549 current employees eligible for the company's new mentorship program.

- Reviewing breakdowns of mentors and retiring employees by departments.
    
    (_Eligible mentors by department_)-----(_Retiring employees by department_)
    
    ![Eligible_Mentors_By_Dept](https://user-images.githubusercontent.com/106599446/178111477-7e10456a-9af5-4605-8118-d90164e67813.png)
    ![retiring_depts](https://user-images.githubusercontent.com/106599446/178111488-a9486c4a-bf31-40c6-942b-f1782bc4002b.png)

The tables above display the distribution of current employees that are elibile for participating in the mentorship program and retiring employees by department, respectively. Similar to the above findings, when comparing these lists of mentors with the breakdown on soon-to-be retiring employees, its clear that PH will likely need to widen its criteria for eligible mentors or perhaps. Many of the departments have under 100 eligible mentors based on the currently established cirteria, yet will need to transition roughly 5000 retiring employees. It is clear that PH must reconsider its criteria for picking mentors, or perhaps they should determine methods for streamlining efficiency within certain departments that would require less eployees to effectively replace those that will be retiring. 
