CREATE DATABASE 2400000145_DOM_III_DB;
---Created Then inserted---




--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer,
    department_name character(50),
    department_email character(150),
    department_language character(50),
    department_type character(50),
    department_quota integer,
    department_fosquota integer,
    department_period integer,
    department_minscorely integer,
    department_minplacemently integer,
    faculty_id integer,
    department_table_id integer NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_department_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_table_id_seq OWNER TO postgres;

--
-- Name: department_department_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_table_id_seq OWNED BY public.department.department_table_id;


--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_table_id integer NOT NULL,
    faculty_id integer NOT NULL,
    faculty_name character(50) NOT NULL,
    faculty_email character(150) NOT NULL,
    university_id integer NOT NULL
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: faculty_faculty_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculty_faculty_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculty_faculty_table_id_seq OWNER TO postgres;

--
-- Name: faculty_faculty_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculty_faculty_table_id_seq OWNED BY public.faculty.faculty_table_id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    student_name character(50) NOT NULL,
    student_surname character(50) NOT NULL,
    student_score integer NOT NULL,
    student_rank integer NOT NULL,
    student_topornot boolean NOT NULL,
    student_choise_one integer,
    student_choise_two integer,
    student_choise_three integer,
    faculty_won integer,
    student_table_id integer NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_student_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_student_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_student_table_id_seq OWNER TO postgres;

--
-- Name: student_student_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_table_id_seq OWNED BY public.student.student_table_id;


--
-- Name: university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university (
    university_tableid integer NOT NULL,
    university_id integer,
    university_name character(50),
    university_address character(100),
    university_email character(150),
    university_city character(50),
    university_type character(50),
    university_fndyear integer
);


ALTER TABLE public.university OWNER TO postgres;

--
-- Name: university_university_tableid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_university_tableid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.university_university_tableid_seq OWNER TO postgres;

--
-- Name: university_university_tableid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_university_tableid_seq OWNED BY public.university.university_tableid;


--
-- Name: department department_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_table_id SET DEFAULT nextval('public.department_department_table_id_seq'::regclass);


--
-- Name: faculty faculty_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty ALTER COLUMN faculty_table_id SET DEFAULT nextval('public.faculty_faculty_table_id_seq'::regclass);


--
-- Name: student student_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_table_id SET DEFAULT nextval('public.student_student_table_id_seq'::regclass);


--
-- Name: university university_tableid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university ALTER COLUMN university_tableid SET DEFAULT nextval('public.university_university_tableid_seq'::regclass);


ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_department_id_key UNIQUE (department_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_table_id);


--
-- Name: faculty faculty_faculty_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_faculty_id_key UNIQUE (faculty_id);


--
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_table_id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_table_id);


--
-- Name: student student_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_id_key UNIQUE (student_id);


--
-- Name: university university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT university_pkey PRIMARY KEY (university_tableid);


--
-- Name: university university_university_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT university_university_id_key UNIQUE (university_id);


--
-- Name: department faculty_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT faculty_id FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id) NOT VALID;


--
-- Name: student student_student_choise_one_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_choise_one_fkey FOREIGN KEY (student_choise_one) REFERENCES public.department(department_id) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;


--
-- Name: student student_student_choise_three_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_choise_three_fkey FOREIGN KEY (student_choise_three) REFERENCES public.department(department_id) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;


--
-- Name: student student_student_choise_two_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_choise_two_fkey FOREIGN KEY (student_choise_two) REFERENCES public.department(department_id) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;


--
-- Name: faculty university_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT university_id FOREIGN KEY (university_id) REFERENCES public.university(university_id) NOT VALID;


--
-- PostgreSQL database dump complete
--




---------------------------------------
---------------------------------------2400000145_0_DATABASE_CREATION_QUERY.sql END
---------------------------------------



----------------------------------------------
---university INSERT START
----------------------------------------------
---2400000145_1_INSERT_THIS_FIRST_university_insert_.sql
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100000, 'DOKUZ EYLUL UNIVERSITY', 'BUCA', 'deu@deu.edu.tr', 'IZMIR', 'State', 1982);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100001, 'EGE UNIVERSITY', 'BORNOVA', 'ege@ege.edu.tr', 'IZMIR', 'State', 1955);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100002, 'YAŞAR UNIVERSITY', 'BORNOVA', 'yasar@yasar.edu.tr', 'IZMIR', 'Private', 2001);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100003, 'EKONOMI UNIVERSITY', 'BALCOVA', 'eko@eko.edu.tr', 'IZMIR', 'Private', 2001);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100004, 'Izmir Technical University.', 'URLA', 'iztech@iztech.edu.tr', 'IZMIR', 'State', 1992);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100005, 'Izmir University', 'Somewhere only we now', 'izu@izu.edu.tr', 'IZMIR', 'Private', 20083);
INSERT INTO public.university(
university_tableid, university_id, university_name, university_address, university_email, university_city, university_type, university_fndyear)
VALUES (DEFAULT, 100006, 'Katip Celebi University', 'Cigli', 'ikcu@ikcu.edu.tr', 'IZMIR', 'State', 2010);



----------------------------------------------
---university INSERT END
----------------------------------------------






----------------------------------------------
---FACULTY INSERT START
----------------------------------------------
---2400000145_2_INSERT_THIS_SECOND_FACULTY_INSERT.sql

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100001023, 'Engineering' , 'deueng@deueng.deu.edu.tr', 100000);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 101201023, 'Architecture' , 'izu@edu.tr', 100005);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 1017001023, 'Engineering' , 'izu@edu.tr', 100005);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100311023, 'Law' , 'izu@edu.tr', 100005);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100001032, 'Law' , 'deulaw@deulaw.edu.tr', 100000);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100001143, 'Medicine' , 'deumed@deumed.edu.tr', 100000);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 10000187, 'Literature' , 'deulit@deulit.edu.tr', 100000);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100011023, 'Engineering' , 'egeeng@egeeng.ege.edu.tr', 100001);

INSERT INTO public.faculty(faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100001123, 'Medicine' , 'medege@egemed.ege.edu.tr', 100001);
INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100002134, 'Engineering' , 'yasareng@yasareng.yasar.edu.tr', 100002);

INSERT INTO public.faculty(
faculty_table_id, faculty_id, faculty_name, faculty_email, university_id)
VALUES (DEFAULT, 100002222, 'Fine Arts' , 'yasarart@yasarart.yasar.edu.tr', 100002);
----------------------------------------------
---FACULTY INSERT END
----------------------------------------------



----------------------------------------------
---DEPARTMENT INSERT START
----------------------------------------------
---2400000145_3_INSERT_THIS_THIRD_DEPARTMENT_INSERT.sql
INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (103110441, 'Computer Engineering', 'ceng@ceng.deu.edu.tr', 'ENG', 'Regular', 90, 4, 4, 266.94283, 232000, 100001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (103110469,  'Computer Engineering', 'ceng@ceng.deu.edu.tr', 'ENG', 'Evening', 90, 4, 4, 200, 300000, 100001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (103110445, 'Electric and Electronic Engineering', 'eee@eee.deu.edu.tr', 'ENG', 'Regular', 90, 1, 4, 180000.94283, 300000, 100001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (103410412, 'Environmental Engineering', 'ee@ee.deu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 190, 310000, 100001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (206010345, 'Industrial Engineering', 'inysr@.ysr.edu.tr', 'ENG', 'Regular', 45, 1, 4, 190, 310000, 100002134, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (206010346, 'Biomedical Engineering', 'bioysr@.ysr.edu.tr', 'ENG', 'Regular', 45, 1, 4, 190, 310000, 100002134, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (206012336, 'Department of Law', 'lawdeu@lawdeu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 288, 354000, 100001032, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (221122236, 'Department of JUSTICE LEAGUE', 'lawdeu@lawdeu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 288, 354000, 100001032, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (6012336, 'Department of Law', 'lawdeu@lawdeu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 150, 354000, 100001032, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (22101546, 'Department of JUSTICE LEAGUE', 'lawdeu@lawdeu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 315, 354000, 100001032, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (1034123110412, 'Environmental Engineering', 'izu@izu.edu.tr', 'TUR', 'Regular', 45, 1, 4, 256, 310000, 1017001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (2060123110345, 'Industrial Engineering', 'izu@izu.edu.tr', 'ENG', 'Evening', 45, 1, 4, 100, 310000, 1017001023, DEFAULT);

INSERT INTO public.department(
department_id, department_name, department_email, department_language, department_type, department_quota, department_fosquota, department_period, department_minscorely, department_minplacemently, faculty_id, department_table_id)
VALUES (20601120346, 'Biomedical Engineering', 'izu@izu.edu.tr', 'ENG', 'Evening', 45, 1, 4, 234, 310000, 1017001023, DEFAULT);

----------------------------------------------
---DEPARTMENT INSERT END
----------------------------------------------


----------------------------------------------
---STUDENT INSERT START
----------------------------------------------
---2400000145_4_INSERT_THIS_FOURTH_STUDENT_INSERT.sql
INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510001, 'Mehmet', 'Uslu', 230, 250000, TRUE, 103110441, 103110469, 103410412, -1);

INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510002, 'Ezgi', 'Şahin', 300, 1000, TRUE, 103110441, 103110469, 103410412, -1);

INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510003, 'Devrim', 'Yılmaz', 250, 12342, TRUE, 206010345, 103110441, 206010346, -1);

INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510004, 'Hamdi', 'Uslu', 290, 250000, TRUE, 103110441, 103110469, 103410412, -1);

INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510005, 'Berfin', 'Şahin', 200, 1000, TRUE, 103110441, 103110469, 103410412, -1);
---students
INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510006, 'Kerim', 'Embel', 310, 250000, TRUE, 103110441, 103110469, 103410412, -1);

INSERT INTO public.student(
student_table_id, student_id, student_name, student_surname, student_score, student_rank, student_topornot, student_choise_one, student_choise_two, student_choise_three, faculty_won)
VALUES (DEFAULT, 2020510007, 'Onur', 'Kantar', 278, 1000, TRUE, 103110441, 103110469, 103410412, -1);

----------------------------------------------
---STUDENT INSERT END
----------------------------------------------


----------------------------------------------
--- Student Placement START
----------------------------------------------

UPDATE public.student
SET    faculty_won = 1
WHERE student_id IN (Select distinct student_id
FROM public.student as s
INNER JOIN public.department
ON (s.student_choise_one= department.department_id OR s.student_choise_two= department.department_id OR s.student_choise_three= department.department_id )AND (s.student_score > department.department_minscorely )
WHERE s.student_score > department.department_minscorely
)


---Student Placement end THIS QUERY DECIDES IF A STUDENT WON ANY OF ITS CHOISES AND MAKES faculty_won 1 IF THEY GET IN STUDENTS ARE INSERTED AS -1 ON THEIR faculty_won VARIABLE AT THE BEGINNING
----------------------------------------------
--- Student Placement END
----------------------------------------------




----------------------------------------------
---QUESTIONWS QUERIES START
----------------------------------------------

---
------Query1
---
SELECT  university_name ,university_city,university_fndyear
FROM public.university
WHERE lower(substr(university_city ,1,1)) in ('i') and  (university_fndyear > 1990);



---
------Query2
---


SELECT faculty.university_id, faculty.faculty_name, university.university_name, university.university_tableid
FROM public.faculty
INNER JOIN public.university ON faculty.university_id = university.university_id
WHERE (LOWER(faculty.faculty_name) LIKE '%engineering%' or LOWER(faculty.faculty_name) LIKE '%medicine%');

---
------Query3
---

SELECT COUNT(faculty_id), university.university_type
FROM public.faculty
INNER JOIN public.university ON faculty.university_id= university.university_id
WHERE LOWER(university_type) IN (LOWER('State')) OR LOWER(university_type) IN (LOWER('Private'))
GROUP BY university_type


---
------Query4
---

SELECT department_name, department_type
FROM public.department
WHERE LOWER(department_name) LIKE ('%engineering%') and LOWER(department_type) LIKE('%evening%');

---
------Query5
---

SELECT department_name,department_minscorely , MAX(department.department_period )
FROM public.department
GROUP BY department_name,department_minscorely
ORDER BY  department_minscorely DESC
FETCH FIRST 5 ROWS ONLY

---
------Query6
---
select Number, count(*), department.department_name,department.department_id From (select student_choise_one as Number from public.student
union all
select student_choise_two as Number from public.student
union all
select student_choise_three as Number from public.student
) myTab
INNER JOIN  public.department ON (Number =department_id)
group by Number , department.department_name , department.department_id
ORDER BY Number ASC



---
------Query7
---

select  student.student_choise_one ,student.student_score , department.department_name, department.department_id
FROM public.student
INNER JOIN public.department ON( student.student_choise_one = department.department_id )
Where LOWER(department_name) LIKE ('%computer engineering%')
ORDER BY student.student_score DESC

---
------Query8
---
UPDATE public.faculty
SET university_id = 100004
WHERE faculty_id IN(
select faculty_id
FROM public.faculty
INNER JOIN public.university ON university.university_id= faculty.university_id
WHERE( LOWER(university_name) LIKE('%dokuz%') AND faculty.faculty_name LIKE '%Engineering%')
);



---
------Query9
---

UPDATE public.department
SET department_period = (department_period+1)
WHERE department.faculty_id IN (
select faculty.faculty_id
FROM public.faculty
INNER JOIN public.department ON( faculty.faculty_id =department.faculty_id )
WHERE (LOWER(faculty_name) LIKE('%law%')));


---
------Query10
---

DELETE FROM public.department
WHERE  department.department_id  IN (
SELECT department.department_id
FROM public.department
INNER JOIN public.faculty ON  faculty.faculty_id= department.faculty_id
INNER JOIN public.university ON  faculty.university_id= university.university_id
WHERE( LOWER(university.university_name) LIKE ('%izmir university%'))
ORDER BY department.faculty_id
);

DELETE FROM public.faculty
WHERE  faculty.university_id  IN (
SELECT faculty.university_id
FROM public.faculty
INNER JOIN public.university ON  faculty.university_id= university.university_id
WHERE( LOWER(university.university_name) LIKE ('%izmir university%'))
ORDER BY university.university_name
);


----------------------------------------------
---QUESTIONWS QUERIES END
----------------------------------------------
