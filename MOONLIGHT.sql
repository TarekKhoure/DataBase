create database MOONLIGHT;
use moonlight;

create table employee(
id int,
name varchar(30),
salary float,
gender varchar(20),
birth_date date,
employee_num int primary key not null,
phone_number int,
address varchar(30),
room_id int,
foreign key(room_id) references room(room_id)on update cascade,
banquet_id int,
foreign key(banquet_id) references banquet(banquet_id)on update cascade);

insert into employee(id,name,salary,birth_date,employee_num,address) values (
(100,"Essa Salameh",-500,"04-09-1999",1170575,"Bedya"),
(101,"Tarek Khoury",10000,"02-06-1999",1173019,"Aboud"),
(102,"Jihad Jitan",100,"25-5-2002",1172858,"Nablus"));
create table room(
room_id int primary key not null,
room_type varchar(30),
room_rank varchar(30),
reservation_date date,
room_status varchar(30),
field_name varchar(30),
foreign key (field_name) references duration (field_name));

create table duration(
field_name varchar(30) primary key,
check_in date,
check_out date);

create table payment(
payment_id int not null primary key,
amount_paid float,
payment_date date,
customer_id int,
foreign key(customer_id) references customer(customer_id),
field_name varchar(30),
foreign key(field_name) references duration(field_name),
banquet_id int,
foreign key(banquet_id) references banquet(banquet_id),
order_num int,
foreign key(order_num) references orders(order_num),
employee_num int,
foreign key(employee_num) references employee(employee_num));

create table cruise(
cruise_id int primary key not null,
cruise_charge float,
cruise_host varchar(30),
cruise_discreption varchar(30),
cruise_type varchar(30),
employee_num int,
foreign key(employee_num) references employee(employee_num));
select * from cruise;

insert into cruise(cruise_id,cruise_charge,cruise_host,cruise_discreption,cruise_type,employee_num)values
(1,50,"Mohammad Assaf","Party that fits 50 person","Party on pool",1173019),
(2,100,"Najwa Karam","Party that fits 100 person","Party in holl",1170575),
(3,70,"Synaptic","Rap Festival","Rap",1172858);

select *from cruise;

create table facilities(
id int primary key not null,
facility_type varchar(30),
facility_charge float);

create table customer(
customer_id int primary key not null,
customer_name varchar(30),
phone_number int,
address varchar(30),
email varchar(30),
gender varchar(30),
room_id int,
foreign key(room_id) references room(room_id),
cruise_id int,
foreign key(cruise_id) references cruise(cruise_id));

create table orders(
order_num int primary key not null,
order_type varchar(30),
order_price float,
customer_id int,
foreign key(customer_id) references customer(customer_id));

create table banquet(
banquet_id int primary key not null,
start_time varchar(30),
end_time varchar(30),
date_reserved date,
banquet_oders varchar(30));

create table emp2cust (
employee_num int,
customer_id int,
primary key(employee_num,customer_id),
foreign key(employee_num) references employee(employee_num),
foreign key(customer_id) references customer(customer_id));

create table emp2fac(
employee_num int,
id int,
primary key(employee_num,id),
foreign key(employee_num) references employee(employee_num),
foreign key(id) references facilities(id));

create table books(
field_name varchar(30),
customer_id int,
primary key(field_name,customer_id),
foreign key(customer_id) references customer(customer_id),
foreign key(field_name) references duration(field_name));

create table cruise_pay(
cruise_id int,
payment_id int,
primary key(cruise_id,payment_id),
foreign key(cruise_id) references cruise(cruise_id),
foreign key(payment_id) references payment(payment_id));

create table go(
customer_id int,
id int,
primary key(id,customer_id),
foreign key(customer_id) references customer(customer_id),
foreign key(id) references facilities(id));

create table Dine(
customer_id int,
banquet_id int,
primary key(customer_id,banquet_id),
foreign key(customer_id) references customer(customer_id),
foreign key(banquet_id) references banquet (banquet_id));


 



 


