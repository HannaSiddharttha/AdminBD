create table if not exists quesos(
id_queso int (10) Not null primary key,
kind_queso varchar (30) Not null,
price_queso varchar (20) Not null,
unit_queso int not null) ENGINE = InnoDB;

create table if not exists bitacora(
id_bitacora int (10) auto_increment primary key,
id_queso int (10),
kind_queso varchar (30),
previousname varchar (30),
newname varchar (30),
previousprice varchar (20),
newprice varchar (20),
previous_stock int,
new_stock int,
users varchar (50),
atdate datetime,
act varchar (25))ENGINE = InnoDB;

create trigger implement after insert
on quesos
for each row
insert into bitacora (id_queso, newname, newprice, new_stock, users, atdate, act)
values (new.id_queso, new.kind_queso, new.price_queso, new.unit_queso, user(), now(), 'Add');

create trigger updte after update
on quesos
for each row
insert into bitacora (id_queso, previousname, newname, previousprice, newprice, previous_stock, new_stock, users, atdate, act)
values (new.id_queso, old.kind_queso, new.kind_queso, old.price_queso, new.price_queso, old.unit_queso, new.unit_queso, user(), now(), 'Updated'); 

create trigger delet after delete
on quesos
for each row
insert into bitacora (id_queso, kind_queso, previousprice, newprice, users, atdate, act)
values (old.id_queso, old.kind_queso,  old.price_queso,  old.price_queso, user(), now(), 'Deleted');


insert into quesos (id_queso, kind_queso, price_queso, unit_queso)
values (1075, "Oaxaca Chese", "99.00", 20);

update quesos set unit_queso="34", kind_queso="Daysi" where id_queso=1075; 

delete from quesos where id_queso='1087' limit 1;