#We have previously made a database, "parks_and_recreation".

#Using SELECT statement-

SELECT * 
FROM employee_demographics;

#In the right hand side bar we can see that the parks and recreation database is selected, as it is highlighted in bold fonts. Now, if for example we are using 'sys' database, this result which is coming now won't be fetched. (DOUBLE TAP ON A DATABASE TO MAKE IT THE DEFAULT/ PRIMARY DATABASE WITH WHICH WE'RE WORKING.)

#Now, what can we do if there is another database selected?- We can just mention which database we're using .

SELECT *
FROM parks_and_recreation.employee_demographics;

#We can also fetch individual tables through SELECT , such as-

SELECT first_name,
last_name,
gender,
age,
age + 10 #Yes we can also calculate stuff like this.
FROM parks_and_recreation.employee_demographics;

#NOW, just like BODMAS is used in math, there's a similar method for the order of calculation performed in MYSQL, called,
#PEMDAS - Parenthesis, Exponential, Multiplication, Addition, Substraction.

SELECT first_name,
last_name,
gender,
age,
(age + 10) *10 + 10
FROM parks_and_recreation.employee_demographics;

#We can fetch unique values , if there is any duplicates, with the use of 'DISTINCT' keyword -
SELECT DISTINCT gender
FROM employee_demographics; #In the gender column as there is only 2 types of gender present, it fetches only the unique 2 types

#DISTINCT gets applied on the frist column only-
SELECT DISTINCT first_name, gender
FROM employee_demographics; #See as the distinct gets applied on the first_name column, it fetches just the unique values, if any from that column. And the unique values comes with their respective genders, the distinct is not applied there.

#The flash icon will run the entire code, while the flash with the cursor icon will run the code where the cursor is currently present.
