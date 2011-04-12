-- таблица контактов
INSERT INTO kafedra.contacts(adres,phones,email,site)
  VALUES ('Москва, ул. Вильгельма Пика, д.4. корп. 5, каб.406',
  '904483999; 384999302','mymail@mail.ru','www.rgsu.net');


-- таблица истории
INSERT INTO kafedra.histories(hist_text)
  VALUES ('Здесь идёт история нашей кафедры');


-- таблица дисциплин
INSERT INTO kafedra.disciplines(name_disc)
  VALUES('Технология разработки программного обеспечения');
INSERT INTO kafedra.disciplines(name_disc)
  VALUES('Параллельные системы и параллельное программирование');
INSERT INTO kafedra.disciplines(name_disc)
  VALUES('Теория языков программирования');
INSERT INTO kafedra.disciplines(name_disc)
  VALUES('Семантика языков программирования');

-- cпециальности
INSERT INTO kafedra.specials(cod, name_spec, sokr_spec,name_dipl)
  VALUES ('230100','Информатика и вычислительная техника','ИВТ','Бакалавр техники и технологии');
INSERT INTO kafedra.specials(cod, name_spec, sokr_spec,name_dipl)
  VALUES ('230105.65','Программное обеспечение вычислительной техники','ПОВТ','Инженер программист');

-- новости
INSERT INTO kafedra.kafnews(title_new,text_new,date_pub,prioritet)
  VALUES ('Самая первая новость','Приоритет новости нужен для того, чтобы определить
  какая новость должна показываться первой! А вдруг','1998-02-03 22:23:00',0);
INSERT INTO kafedra.kafnews(title_new,text_new,date_pub,prioritet)
  VALUES ('Вторая новость','Приоритет новости больше чем у 1, но меньше чем у 3','1994-02-03 22:11:00',4);
INSERT INTO kafedra.kafnews(title_new,text_new,date_pub,prioritet)
  VALUES ('Третья новость','Самый большой приоритет новости','1990-02-03 10:23:00',10);

-- persons
INSERT INTO kafedra.persons(l_name,f_name,p_name,birth,phone,email,nature)
  VALUES ('Маньковский','Иван','Васильевич','1960-01-01','903848883','mail@mail.ru','t');
INSERT INTO kafedra.persons(l_name,f_name,p_name,birth,phone,email,nature)
  VALUES ('Чиликин','Михаил','Геннадьевич','1987-11-16','90222234343','chilout@ya.ru','s');
INSERT INTO kafedra.persons(l_name,f_name,p_name,birth,phone,email,nature)
  VALUES ('Гудилин','Владислав','Олегович','1989-10-28','9124838277','allgood@gmail.ru','s');
INSERT INTO kafedra.persons(l_name,f_name,p_name,birth,phone,email,nature)
  VALUES ('Исаев','Григорий','Апполонович','1990-01-30','9445332217','agood@gmail.ru','s');
INSERT INTO kafedra.persons(l_name,f_name,p_name,birth,phone,email,nature)
  VALUES ('Фальк','Вадим','Николаевич','1950-03-25','912433872','falkvn@12345.ru','t');



-- students
INSERT INTO kafedra.students(id_pers,id_spec,course,info)
  VALUES (2,1,3,'Редко посещал пары!');
INSERT INTO kafedra.students(id_pers,id_spec,course,info)
  VALUES (3,2,1,'Увлекался музыкой!');
INSERT INTO kafedra.students(id_pers,id_spec,course,info)
  VALUES (4,1,2,'Видел его всего 1 раз!!!');


-- teachers
INSERT INTO kafedra.teachers(id_pers,uch_step,position,info)
  VALUES(1,'Кандидат математических наук','Заведующий кафедры','Замечательный человек');
INSERT INTO kafedra.teachers(id_pers,uch_step,position,info)
  VALUES(5,'Кандидат математических наук','Доцент','Вёл теорию языков программирования');