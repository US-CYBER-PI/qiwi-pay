create table roles
(
    id SERIAL not null constraint PK_Role primary key,
    name varchar (30) not null

);

create table tokens
(
    id SERIAL not null constraint PK_Token primary key,
    status bool not null,
    expired_date timestamp not null,
    token varchar (255) not null
);

create table users
(
    id SERIAL not null constraint PK_User primary key,
    phone varchar (30) not null,
    password varchar (200) not null,
    role_id int not null references roles (id),
    token_id int references tokens (id)
);

create table payments
(
    id SERIAL not null constraint PK_Payment primary key,
    amount integer not null,
    user_id int not null references users (id),
    bill_id varchar (200) not null,
    status varchar (30) not null,
    pay_token_identifier   varchar (255) not null
);

create or replace procedure roles_Insert (p_name varchar(30))
language plpgsql
as $$
 DECLARE have_record int := count(*) from roles where name = p_name;
	begin
	if have_record > 0 then
			raise exception 'Уже есть данная запись';
	else
insert into roles(name)
values (p_name);
	end if;
	end;
$$;

insert into roles(name) values ('user'),('merchant');