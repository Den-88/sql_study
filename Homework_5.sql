CREATE DATABASE IF NOT EXISTS homework_5;
USE homework_5;

CREATE TABLE IF NOT EXISTS Cars (
    Id INT PRIMARY KEY NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Cost INT NOT NULL,
	PRIMARY KEY (Id)
);

INSERT INTO Cars (Id, Name, Cost)
VALUES
    (1, 'Audi', 52642),
    (2, 'Mercedes', 57127),
    (3, 'Skoda', 9000),
    (4, 'Volvo', 29000),
    (5, 'Bentley', 350000),
    (6, 'Citroen', 21000),
    (7, 'Hummer', 41400),
    (8, 'Volkswagen', 21600);

SELECT * FROM Cars;

-- Задание 1

CREATE VIEW MyView AS
SELECT * FROM Cars
WHERE Cost < 25000;

SELECT * FROM MyView;

-- Задание 2

ALTER VIEW MyView AS 
SELECT * FROM Cars 
WHERE Cost < 30000;

SELECT * FROM MyView;

-- Задание 3

CREATE VIEW SkodaAndAudi AS
SELECT * FROM Cars
WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM SkodaAndAudi;

-- Задание 4

CREATE TABLE IF NOT EXISTS Analysis (
    an_id INT NOT NULL,
    an_name VARCHAR(30) NOT NULL,
    an_cost INT NOT NULL,
    an_price INT NOT NULL,
    an_group INT NOT NULL,
    PRIMARY KEY (an_id)
);

CREATE TABLE IF NOT EXISTS GroupsAnalys (
    gr_id INT NOT NULL,
    gr_name VARCHAR(30) NOT NULL,
    gr_temp VARCHAR(30) NOT NULL,
    PRIMARY KEY (gr_id)
);

CREATE TABLE IF NOT EXISTS Orders (
    ord_id INT NOT NULL,
    ord_datetime DATETIME NOT NULL,
    ord_an INT NOT NULL,
    PRIMARY KEY (ord_id)
);

INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES
    (1, 'Анализ 1', 100, 200, 1),
    (2, 'Анализ 2', 150, 300, 1),
    (3, 'Анализ 3', 80, 180, 2),
    (4, 'Анализ 4', 200, 400, 2),
    (5, 'Анализ 5', 250, 500, 3),
    (6, 'Анализ 6', 330, 700, 2),
    (7, 'Анализ 7', 130, 100, 3);


INSERT INTO GroupsAnalys (gr_id, gr_name, gr_temp)
VALUES
    (1, 'Группа 1', 'Нормальный'),
    (2, 'Группа 2', 'Низкий'),
    (3, 'Группа 3', 'Высокий');

INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
    (1, '2020-02-05 09:30:00', 7),
    (2, '2020-02-09 14:15:00', 5),
    (3, '2020-02-07 11:20:00', 3),
    (4, '2020-02-11 16:45:00', 2),
    (5, '2020-02-03 13:00:00', 1),
    (6, '2020-02-12 10:30:00', 6),
    (7, '2020-02-15 15:00:00', 4);

CREATE VIEW AnalysisView AS
SELECT a.an_name, a.an_price
FROM Analysis a
JOIN Orders o ON a.an_id = o.ord_an
WHERE o.ord_datetime >= '2020-02-05' AND o.ord_datetime < '2020-02-13';

SELECT * FROM AnalysisView;

-- Задание 5

CREATE TABLE train (
    train_id INT,
    station VARCHAR(20),
    station_time TIME
);

INSERT INTO train (train_id, station, station_time)
VALUES
    (110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');

SELECT
    train_id,
    station,
    station_time,
    TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id), station_time) AS time_to_next_station
FROM
    train;




