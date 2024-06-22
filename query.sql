# Lab 7

## Завдання 1
#Напишіть SQL-запит, який для таблиці orders з атрибута date витягує рік, місяць і число.
#Виведіть на екран їх у три окремі атрибути поряд з атрибутом id та оригінальним атрибутом date.

### variant 1
select id, date as original, Year(date) as Year, Month(date) as Month, Day(date) as Day
from orders;

### variant 2
select id,
       date as original,
       DATE_FORMAT(date, '%Y') as Year,
       DATE_FORMAT(date, '%m') as Month,
       DATE_FORMAT(date, '%d') as Day
from orders;

## Завдання 2
#Напишіть SQL-запит, який для таблиці orders до атрибута date додає один день.
#Виведіть атрибут id, оригінальний атрибут date та результат додавання.

### variant 1
select id, date, date + interval 1 day as nextDay
from orders;

### variant 2
select id, date, DATE_ADD(date, interval 1 day) as nextDay
from orders;

## Завдання 3
#Напишіть SQL-запит, який для таблиці orders для атрибута date відображає кількість секунд
#з початку відліку (показує його значення timestamp).
#Виведіть атрибут id, оригінальний атрибут date та результат роботи функції.

select id, date, UNIX_TIMESTAMP(date) as seconds
from orders;

## Завдання 4
#Напишіть SQL-запит, який рахує, скільки таблиця orders містить рядків з атрибутом date
#у межах між 1996-07-10 00:00:00 та 1996-10-08 00:00:00.

### variant 1
select count(date) as amount
from orders
where date between '1996-07-10 00:00:00' and '1996-10-08 00:00:00';

### variant 2
select count(date) as amount
from orders
where date >= '1996-07-10 00:00:00' and date <= '1996-10-08 00:00:00';

## Завдання 5
#Напишіть SQL-запит, який для таблиці orders виводить на екран атрибут id, атрибут date та
#JSON-об’єкт {"id": <атрибут id рядка>, "date": <атрибут date рядка>}.

select id, date, json_object('id', id,'date', date) as json from orders;
