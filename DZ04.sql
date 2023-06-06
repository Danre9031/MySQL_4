USE DZ04;

/*
Задание №1.. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
*/
SELECT
	color,
	mark,
	COUNT(1)
FROM auto
	WHERE mark IN ('BMW', 'LADA') 
	GROUP BY color, mark
	ORDER BY mark;
/*
Задание №2.. Вывести на экран марку авто(количество) и количество авто не этой
марки.
100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70 машин другой
марки, LADA - 15, 85 авто другой марки
*/
SELECT
	MARK,
	(SELECT COUNT(*) FROM auto) 
    -  COUNT(MARK) AS Other_mark_auto
FROM AUTO
	GROUP BY mark
	ORDER BY mark;
/*
Задание №3.
Даны 2 таблицы, созданные следующим образом:
*/


create table test_a (id INT, data_ varchar(1));
create table test_b (id int);
insert into test_a(id, data_) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

/*
__
__
Напишите запрос, который вернет строки из таблицы test_a, id 
которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/
SELECT 
	a.*
FROM test_a AS a
  LEFT JOIN test_b AS b
  ON a.id=b.id
  WHERE b.id IS NULL;

