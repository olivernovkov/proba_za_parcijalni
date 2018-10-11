create table Prodavnica(
id int auto_increment primary key,
ime varchar(50) not null,
tip_prodavnice varchar(30),
adresa int,
vlasnik int
); 
create table Covek(
id int auto_increment primary Key,
ime varchar(50) not null,
prezime varchar(50) not null,
godine int,
stepem_strucne_spreme int not null,
mesto_stanovanja int
);
create table Proizvod(
id int auto_increment primary Key,
ime varchar(50) not null,
tip_proizvoda varchar(50) not null,
cena double not null,
proizvodjac int not null
);
create table Fabrika(
id int auto_increment primary key,
ime varchar(50) not null,
vlasnik int not null,
adresa int
);
create table Grad(
id int auto_increment primary Key,
ime varchar(50) not null,
drzava varchar(50) not null
);
create table Adresa(
id int auto_increment primary Key,
ulica varchar(50) not null,
broj int not null,
grad int not null,
adresa_prodavnice int,
adresa_fabrike int
);
alter table Prodavnica
add constraint fk_adresa foreign key (adresa) references adresa(id) on delete set null on update cascade,
add constraint fk_vlasnik foreign key (vlasnik) references Covek(id) on delete cascade on update cascade,
add constraint uq_adresa unique (adresa);

alter table Covek
add constraint fk_mesto_stanovanja_coveka foreign key (mesto_stanovanja) references Grad(id) on delete set null on update cascade;

alter table Proizvod
add constraint fk_proizvodjac foreign key (proizvodjac) references Fabrika(id) on delete cascade on update cascade;

alter table Fabrika
add constraint fk_vlasnik_fabrike foreign key (vlasnik) references Covek(id) on delete cascade on update cascade,
add constraint fk_adresa_fabrike foreign key (adresa) references adresa(id) on delete set null on update cascade,
add constraint uq_adresa_fabrike unique (adresa);

create table Prodavnica_covek_zaposleni(
id int auto_increment primary key,
prodavnica_id int not null,
covek_id int not null,
foreign key(prodavnica_id) references Prodavnica(id) on delete cascade,
foreign key(covek_id) references Covek(id) on delete cascade,
unique (covek_id)
);

create table Proizvod_u_ponudi(
id int auto_increment primary key,
prodavnica_id int not null,
proizvod_id int not null,
foreign key (prodavnica_id) references Prodavnica(id) on delete cascade,
foreign key (proizvod_id) references Proizvod(id) on delete cascade
);

insert into Grad (ime, drzava) values ('Barcelona', 'Spain');

insert into Covek (ime, prezime, nadimak, godine, stepem_strucne_spreme, mesto_stanovanja) values ('Ana-Hope', 'Ibanez', 'Ana', 24, 4, 5);

insert into Adresa (ulica, broj, grad) values ('Laze Nancica', 36, 1);

insert into Fabrika (ime, vlasnik, adresa) values ('Stamparija Stojkov', 4, 3);

insert into Proizvod (id, ime, tip_proizvoda, cena, proizvodjac) values (5, 'Toner', 'kancelarijski materijal', 5700, 3);

insert into Prodavnica (id, ime, tip_prodavnice, adresa, vlasnik) values (3, 'Idea', 'trgovinski lanac', 3, 4);

insert into Proizvod_u_ponudi (prodavnica_id, proizvod_id) values (3,5);














