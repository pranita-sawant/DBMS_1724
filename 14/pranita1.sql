create type indiv_details as object
    (
        name varchar2(40),
        phone varchar2(20),
     height number(3)
    );
    
create table vendors
    (
        vendor_name indiv_details,
        create_date date   
    );

select type_name from sys.user_types; 

select table_name from dict where TABLE_NAME like 'USER_TYPE_ATTRS%';

select * from USER_TYPE_ATTRS;

insert into vendors values(indiv_details('Pranita','9423061244',45),sysdate);

insert into vendors values(indiv_details('Prani','8023061244',55),sysdate);

insert into vendors values(indiv_details('Afsar','9999961244',50),sysdate);

select (vendor_name).name from vendors;   /*display name from table vendor*/

select t.vendor_name from vendors t;  /*while nexting it is useful*/

select t.vendor_name.name from vendors t;

insert into vendors values(indiv_details('pqr','123',5),null);

update vendors set create_date=sysdate where (vendor_name).name='pqr';

update vendors t set create_date=sysdate where (t.vendor_name).name='pqr';

update vendors p set p.vendor_name.height=9 where create_date is null;

/*Member Functions*/
create type studmem as object(
    maths number,
    physics number,
    chem number,
    member function resultval return varchar2
    );


create type body studmem as member function resultval return varchar2 is
t number;
begin
 t:=maths+physics+chem;
 if t<45 then return('FAIL');
 else return('PASS');
 END IF;
 END;
 END;
 
 create table studmemtab(
    rollno number(20),
    name varchar2(20),
    marks studmem
    );
    
insert into studmemtab values(101,'Sami',studmem(89,90,56));


insert into student values(1701,'D_souza');

insert into student values(1702,'D''souza');

select * from student where name like '%\_%' escape '\'; 

select * from student where name like '%\'%' escape '''; 