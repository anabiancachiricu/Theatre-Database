--CHIRICU ANA BIANCA
--GRUPA 243
--PROIECT SGBD
--BAZA DE DATE PENTRU SPECTACOLE DE TEATRU

CREATE TABLE Piesa(
    id_piesa NUMBER(3) NOT NULL PRIMARY KEY, 
    titlu VARCHAR2(30),
    an_aparitie NUMBER(4)
);

ALTER TABLE piesa
MODIFY titlu VARCHAR2(100);
ALTER TABLE piesa
DROP COLUMN an_aparitie;
ALTER TABLE piesa
ADD data_premiera date;

CREATE TABLE Locatie(
    id_locatie NUMBER(3) NOT NULL PRIMARY KEY,
    oras VARCHAR2(30),
    strada VARCHAR2(30),
    numar NUMBER(4)
);

ALTER TABLE Locatie 
ADD nume VARCHAR2(100);

CREATE TABLE Spectacol(
    id_spectacol NUMBER(3) NOT NULL PRIMARY KEY, 
    data TIMESTAMP,
    id_locatie NUMBER(3),
    id_piesa NUMBER(3),
    FOREIGN KEY (id_piesa) REFERENCES Piesa(id_piesa),
    FOREIGN KEY (id_locatie) REFERENCES Locatie(id_locatie)
);

CREATE TABLE Bilet(
    id_bilet NUMBER(3) NOT NULL PRIMARY KEY,
    nr_loc NUMBER(2),
    nr_rand NUMBER(2),
    id_spectacol NUMBER(3),
    FOREIGN KEY (id_spectacol) REFERENCES Spectacol(id_spectacol)
);

CREATE TABLE Scoala(
    id_scoala NUMBER(3)NOT NULL PRIMARY KEY,
    oras VARCHAR2(30),
    nume VARCHAR2(100)
);
    
CREATE TABLE Actor(
    id_actor NUMBER(3) NOT NULL PRIMARY KEY,
    nume VARCHAR2(50),
    prenume VARCHAR2(50),
    data_nasterii DATE,
    origine VARCHAR2(30),
    id_scoala NUMBER(3),
    FOREIGN KEY (id_scoala) REFERENCES Scoala(id_scoala)
);
ALTER TABLE actor
ADD salariu NUMBER(5);
CREATE TABLE Personaje(
    nume VARCHAR2(50),
    id_piesa NUMBER(3),
    id_actor NUMBER(3),
    PRIMARY KEY (id_piesa, id_actor),
    FOREIGN KEY (id_piesa) REFERENCES Piesa(id_piesa),
    FOREIGN KEY (id_actor) REFERENCES Actor(id_actor)
);

--Inserarea datelor in tabel

--LOCATII:

INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (1, 'Bucuresti', 'Bd. Nicolae Balcescu', 2 , 'Teatrul Nattional Bucuresti' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (2, 'Bucuresti', 'Calea Victoriei', 42 , 'Teatrul Odeon' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (3, 'Bucuresti', 'Bd. Regina Elisabeta', 45 , 'Teatrul Elisabeta' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (4, 'Bucuresti', 'Sf. Dumitru', 2 , 'Teatrul de Comedie' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (5, 'Bucuresti', 'Bd. Octavian Goga', 1 , 'Teatrul de Opereta' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (6, 'Bucuresti', 'Academiei', 28 , 'Teatrul Exclesior' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (7, 'Ploiesti', 'Toma Caragiu', 13 , 'Teatrul Toma Caragiu' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (8, 'Ploiesti', 'Romana', 106 , 'Teatrul Ancuta' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (9, 'Ploiesti', 'Bd. Independentei', 14 , 'Teatrul Ciufulici' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (10, 'Sibiu', 'Bd. Corneliu Coposu', 2 , 'Teatrul National Sibiu' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (11, 'Brasov', 'Piata Teatrului', 1 , 'Teatrul Sica Alexandrescu' );
INSERT INTO locatie
(id_locatie, oras, strada, numar, nume ) VALUES (12, 'Pitesti', 'Victoriei', 9 , 'Teatrul Alexandru Davila' );

--PIESE:

INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (1, 'Cel mai greu e sa vorbesti despre tine','18-12-2020' );
INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (2, 'Noaptea ursului','22-09-2017' );
INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (3, 'Un bilet spre fericire','14-03-2013' );
INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (4, 'Prins in plasa','24-05-2017' );
INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (5, 'Felii','02-10-2010' );
INSERT INTO piesa
(id_piesa, titlu, data_premiera) VALUES (6, 'Cumparand renul','20-12-2018' );


--SCOLI:

INSERT INTO scoala
(id_scoala, oras, nume) VALUES (1, 'Bucuresti','Universitatea Na?ionalã de Artã Teatralã ?i Cinematograficã IL Caragiale' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (2, 'Constanta','Universitatea Ovidius' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (3, 'Targu Mures','Universitatea Na?ionalã de Arte' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (4, 'Timisoara','Facultatea de Muzica si Teatru' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (5, 'Cluj','Universitatea Babes-Bolyai' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (6, 'Sibiu','Universitatea Lucian Blaga' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (7, 'Iasi','Universitatea de Arte  George Enescu' );
INSERT INTO scoala
(id_scoala, oras, nume) VALUES (8, 'Bucuresti','Universitatea Hyperion' );


--SPECTACOLE:

INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (1, '09-01-2020 19:00',1, 1);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (2, '15-01-2020 17:30',1, 1);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (3, '09-01-2020 19:00',3, 2);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (4, '09-01-2020 19:00',4, 5);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (5, '02-02-2020 15:00',10, 3);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (6, '08-01-2020 20:00',8, 6);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (7, '13-01-2020 19:00',6, 1);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (8, '10-01-2020 18:30',12, 2);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (9, '14-04-2020 17:00',11, 3);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (10, '06-03-2020 19:00',11, 4);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (11, '01-02-2020 21:00',6, 6);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (12, '01-02-2021 21:00',6, 6);

INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (13, '09-01-2021 19:00',1, 1);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (14, '15-01-2021 17:30',1, 1);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (15, '09-01-2021 19:00',3, 2);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (16, '08-01-2021 19:00',4, 5);
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (17, '02-02-2021 15:00',10, 3);

select * from spectacol;

--BILETE:

INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (1, 1,2, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (2, 2,1, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (3, 3,1, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (4, 4,1, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (5, 5,1, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (6, 1,2, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (7, 2,2, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (8, 3,2, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (9, 4,2, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (10, 1,3, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (11, 1,2, 2);

INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (12, 1,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (13, 2,1, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (14, 3,1, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (15, 4,1, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (16, 5,1, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (17, 1,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (18, 2,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (19, 3,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (20, 4,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (21, 1,3, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (22, 1,2, 2);

INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (23, 1,2, 3);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (24, 2,1, 4);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (25, 3,1, 5);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (26, 4,1, 1);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (27, 5,1, 5);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (28, 1,2, 7);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (29, 2,2, 9);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (30, 3,2, 2);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (31, 4,2, 4);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (32, 1,3, 5);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (33, 1,2, 6);

INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (34, 1,2, 13);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (35, 2,1, 14);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (36, 3,1, 15);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (37, 4,1, 15);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (38, 5,1, 15);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (39, 1,2, 17);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (40, 2,2, 9);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (41, 3,2, 12);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (42, 4,2, 14);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (43, 1,3, 15);
INSERT INTO bilet (id_bilet, nr_loc, nr_rand, id_spectacol) VALUES (44, 1,2, 16);

--ACTORI

INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (1, 'Dinculescu', 'Sorin', '25-01-1960', 'romana',3, 2500);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (2, 'Craita', 'Alina', '21-04-1981', 'romana',1, 4600);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (3, 'Pislaru', 'Ana Maria', '22-09-1980', 'romana',1, 2850);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (4, 'Bica', 'Mihai', '10-12-1963', 'romana',1, 5500);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (5, 'Zurovski', 'Bianca', '27-03-1970', 'romana',4, 2000);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (6, 'Ioan', 'Cristian', '10-09-1969', 'romana',5, 4500);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (7, 'Giuritan', 'Mihai', '04-06-1980', 'romana',2, 4000);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (8, 'Butuc ', 'Gabriela', '15-03-1989', 'romana',6, 3800);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (9, 'Popii', 'Ofelia', '09-02-1978', 'romana',7, 4100);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (10, 'Barbu', 'Andrei', '29-09-1987', 'romana',5, 1950);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (11, 'Savu', 'Mihai', '25-11-1990', 'romana',6, 3000);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (12, 'Pascu', 'Anca', '12-12-1993', 'romana',8, 2380);
INSERT INTO actor
(id_actor, nume, prenume, data_nasterii, origine, id_scoala, salariu) VALUES (13, 'Voicu', 'Laura', '11-08-1983', 'romana',7, 4600);


select * from actor

--PERSONAJE:

INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Ofelia', 5, 9);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('John Smith', 4, 4);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Stanley Gardner', 4, 7);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Femeia', 3, 5);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Barbatul', 3, 4);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Enrique', 2, 10);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Jamie', 2, 11);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Florin Dumitrescu', 1, 1);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Ioana Juravlea', 1, 2);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Elisaveta Bara', 1, 3);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Betty', 6, 12);
INSERT INTO personaje (nume, id_piesa, id_actor) VALUES ('Cheryl', 6, 13);

--6. Defini?i un subprogram stocat care sã utilizeze un tip de colec?ie studiat. Apela?i subprogramul.
-- Definiti o procedura cu un tablou indexat de inregistrari in care sa retineti biletele la spectacolele care au avut deja loc si stergeti-le din tabel.
--Afisati elementele tabloului, apoi adaugati inapoi in tabel datele sterse.
select * from spectacol;
select * from bilet;
create or replace procedure ex6
is
    type tablou_indexat is table of bilet%rowtype index by pls_integer;
    t tablou_indexat;
    i number;
begin
    delete from bilet
    where id_spectacol in ( select id_spectacol
                            from spectacol
                            where data<sysdate)
    returning id_bilet, nr_loc, nr_rand, id_spectacol
    bulk collect into t;
    
    i:=t.first;
    while i<=t.last loop
        dbms_output.put_line(t(i).id_bilet||' '||t(i).nr_loc||' '||t(i).nr_rand||' '||t(i).id_spectacol);
        i:=t.next(i);
    end loop;
    
    i:=t.first;
    while i<=t.last loop
        insert into bilet values t(i);
        i:=t.next(i);
    end loop;
end;

begin
    ex6();
end;

--7. Defini?i un subprogram stocat care sã utilizeze un tip de cursor studiat. Apela?i subprogramul.
--Creati un cursor care sa afiseze cati actori participa la fiecare piesa de teatru.

create or replace procedure ex7
is
    c_nr number(4);
    c_titlu piesa.titlu%type;
    cursor c is select titlu titlu_piesa , count(id_actor) nr_actori
                from piesa pi, personaje pe
                where pi.id_piesa=pe.id_piesa
                group by titlu;
begin
    open c;
    loop
        fetch c into c_titlu, c_nr;
        exit when c%notfound;
        if c_nr=0 then
            dbms_output.put_line('La piesa '||c_titlu||' nu au fost alocati actori.');
        elsif c_nr=1 then
            dbms_output.put_line('La piesa '||c_titlu||' joaca un actor.');
        else
            dbms_output.put_line('La piesa '||c_titlu||' joaca '||c_nr||' actori');
        end if;
    end loop;
    close c;
end;

begin
    ex7();
end;

--8. Defini?i un subprogram stocat de tip func?ie care sã utilizeze 3 dintre tabelele definite. 
--Trata?i toate excep?iile care pot apãrea. 
--Apela?i subprogramulastfelîncât sã eviden?ia?i toate cazurile tratate.

-- Sa se creeze o functie care returneaza numarul de bilete vandute pentru un spectacol dintr-o anumita locatie.

create or replace function ex8 (v_nume in locatie.nume%type)
return number is
    nr_bilete number;
    id_loc locatie.id_locatie%type;
    exceptie exception;
    begin 
        select count(id_bilet) into nr_bilete
        from bilet b full join spectacol s on b.id_spectacol=s.id_spectacol
        full join locatie l on s.id_locatie=l.id_locatie
        where upper(l.nume)=upper(v_nume);
            return nr_bilete;
    exception
        when no_data_found then
            raise_application_error(-20000, 'La locatia data nu se tin spectacole');
        when too_many_rows then
            raise_application_error(-20001, 'Sunt mai multe locatii cu acest nume');
        when others then
            raise_application_error(-20002, 'Alta eroare');
end;

select * from locatie
begin 
    dbms_output.put_line(ex8('&v_nume'));
end;

--9 Defini?i un subprogram stocat de tip procedurã care sã utilizeze 5 dintre tabelele definite. 
--Trata?i toate excep?iile care pot apãrea.
--Apela?i subprogramulastfel încât sã eviden?ia?i toate cazurile tratate.

-- De cate ori a jucat un actor dat in fiecare locatie.

create or replace procedure ex9(v_nume in actor.nume%type)
is
    c_nr number(4);
    c_loc locatie.nume%type;
    c_nume actor.nume%type;
    maxim_locatie number(4);
    nume_locatie locatie.nume%type;
    cursor c is select count (a.id_actor) nr, l.nume loc, a.nume nume
                from actor a join personaje pe on a.id_actor=pe.id_actor
                             join piesa pi on pe.id_piesa=pi.id_piesa
                             join spectacol s on pi.id_piesa=s.id_piesa
                             join locatie l on s.id_locatie=l.id_locatie
                where a.nume=v_nume 
                group by a.id_actor, l.nume, a.nume
                order by count(a.id_actor);
begin
    open c;
    loop
        fetch c into c_nr, c_loc,c_nume;
        exit when c%notfound;
        if c_nr=0 then
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' nu a jucat.');
        elsif c_nr=1 then
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' a jucat doar o data.');
        else
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' a jucat de '||c_nr||' ori.');
        end if;
    end loop;
    close c;
exception
    when no_data_found then
        raise_application_error(-20003, 'Nu exista actori cu numele dat');
    when too_many_rows then
        raise_application_error(-20004, 'Exista mai multi actori cu acest nume');
    when others then
        raise_application_error(-20005, 'Alta eroare');
end;

begin
    ex9('&v_nume');
end;
select * from actor

--10.Defini?i un trigger de tip LMD la nivel de comandã. Declan?a?i trigger-ul.

-- Un trigger care sa nu permita modificarea tabelului intre orele 17 si 08.
create or replace trigger ex10
    before insert or update or delete on spectacol
begin
    if(to_char(sysdate, 'HH24') not between 08 and 17)
    then
    raise_application_error(-20007, 'Nu se poate modifica tabelul in timpul noptii');
    end if;
end;

INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (51, '09-01-2021 19:00',1, 1);

drop trigger ex10;

--11.Defini?i un triggerde tip LMD la nivel de linie.Declan?a?i trigger-ul.
--Trigger care sa nu permita inserarea in tabel a unui spectacol care a avut loc deja.

create or replace trigger ex11
    before insert on spectacol
    for each row
begin
    if (:new.data < sysdate) then
        raise_application_error(-20006, 'Nu se poate introduce un spectacol la o data care a trecut');
    end if;
end;
INSERT INTO spectacol
(id_spectacol, data, id_locatie, id_piesa) VALUES (40, '06-03-2020 19:00',11, 4);

drop trigger ex11;

--12. Defini?i un trigger de tip LDD. Declan?a?i trigger-ul.
--Trigger care insereaza in tabela de audit modificariile care se produc asupra schemei.
create table audit_aby (uitilizator varchar2(30),
                    eveniment varchar2(30),
                    nume_obiect varchar2(50),
                    data date);

create or replace trigger ex12
    after create or alter or drop on schema
begin
    insert into audit_aby 
    values (sys.login_user, sys.sysevent, sys.dictionary_obj_name, sysdate);
end;

create table new_12 (id number(2));
drop table new_12;
select * from audit_aby;
drop trigger ex12;


--13. Defini?i un pachet care sã con?inã toate obiectele definite în cadrul proiectului.

create or replace package ex13 as
   procedure ex6;
   procedure ex7;
   function ex8 (v_nume in locatie.nume%type)
        return number; 
     procedure ex9(v_nume in actor.nume%type);
end ex13;
   
create or replace package body ex13 as

    procedure ex6
is
    type tablou_indexat is table of bilet%rowtype index by pls_integer;
    t tablou_indexat;
    i number;
begin
    delete from bilet
    where id_spectacol in ( select id_spectacol
                            from spectacol
                            where data<sysdate)
    returning id_bilet, nr_loc, nr_rand, id_spectacol
    bulk collect into t;
    
    i:=t.first;
    while i<=t.last loop
        dbms_output.put_line(t(i).id_bilet||' '||t(i).nr_loc||' '||t(i).nr_rand||' '||t(i).id_spectacol);
        i:=t.next(i);
    end loop;
    
    i:=t.first;
    while i<=t.last loop
        insert into bilet values t(i);
        i:=t.next(i);
    end loop;
end ex6;

procedure ex7
is
    c_nr number(4);
    c_titlu piesa.titlu%type;
    cursor c is select titlu titlu_piesa , count(id_actor) nr_actori
                from piesa pi, personaje pe
                where pi.id_piesa=pe.id_piesa
                group by titlu;
begin
    open c;
    loop
        fetch c into c_titlu, c_nr;
        exit when c%notfound;
        if c_nr=0 then
            dbms_output.put_line('La piesa '||c_titlu||' nu au fost alocati actori.');
        elsif c_nr=1 then
            dbms_output.put_line('La piesa '||c_titlu||' joaca un actor.');
        else
            dbms_output.put_line('La piesa '||c_titlu||' joaca '||c_nr||' actori');
        end if;
    end loop;
    close c;
end ex7;

function ex8 (v_nume in locatie.nume%type)
return number is
    nr_bilete number;
    id_loc locatie.id_locatie%type;
    exceptie exception;
    begin 
        select count(id_bilet) into nr_bilete
        from bilet b full join spectacol s on b.id_spectacol=s.id_spectacol
        full join locatie l on s.id_locatie=l.id_locatie
        where upper(l.nume)=upper(v_nume);
            return nr_bilete;
    exception
        when no_data_found then
            raise_application_error(-20000, 'La locatia data nu se tin spectacole');
        when too_many_rows then
            raise_application_error(-20001, 'Sunt mai multe locatii cu acest nume');
        when others then
            raise_application_error(-20002, 'Alta eroare');
end ex8;

 procedure ex9(v_nume in actor.nume%type)
is
    c_nr number(4);
    c_loc locatie.nume%type;
    c_nume actor.nume%type;
    maxim_locatie number(4);
    nume_locatie locatie.nume%type;
    cursor c is select count (a.id_actor) nr, l.nume loc, a.nume nume
                from actor a join personaje pe on a.id_actor=pe.id_actor
                             join piesa pi on pe.id_piesa=pi.id_piesa
                             join spectacol s on pi.id_piesa=s.id_piesa
                             join locatie l on s.id_locatie=l.id_locatie
                where a.nume=v_nume 
                group by a.id_actor, l.nume, a.nume
                order by count(a.id_actor);
begin
    open c;
    loop
        fetch c into c_nr, c_loc,c_nume;
        exit when c%notfound;
        if c_nr=0 then
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' nu a jucat.');
        elsif c_nr=1 then
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' a jucat doar o data.');
        else
            dbms_output.put_line('In locatia '||c_loc||' actorul '||c_nume||' a jucat de '||c_nr||' ori.');
        end if;
    end loop;
    close c;
exception
    when no_data_found then
        raise_application_error(-20003, 'Nu exista actori cu numele dat');
    when too_many_rows then
        raise_application_error(-20004, 'Exista mai multi actori cu acest nume');
    when others then
        raise_application_error(-20005, 'Alta eroare');
end ex9;
end ex13;

begin
    ex13.ex6();
end;
begin
    dbms_output.put_line(ex13.ex8('&v_nume'));
end;
begin
    ex13.ex9('&v_nume');
end;