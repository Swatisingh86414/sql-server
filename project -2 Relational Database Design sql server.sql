use market 

--1  Insert data into each of the above tables. With at least two rows in each of
the tables. Make sure that you have created respective foreign keys.

CREATE TABLE ROLE (
id int primary key,
role_name varchar (100)
);
insert into role (id,role_name) values 
(1,'ADMIN'),
(2,'USER'),

select * from ROLE

CREATE TABLE USER_ACCOUNT (
id INT PRIMARY KEY,
user_name varchar (100),
email varchar (254),
password varchar(200),
password_salt varchar (50) NULL,
password_hash_algorithm varchar(50)
    
);
insert into USER_ACCOUNT(id,user_name,email,password,password_salt,password_hash_algorithm) values
(1, 'John Doe', 'john@example.com', 'password123', 'salt123', 'SHA256'),
(2, 'Jane Smith', 'jane@example.com', 'password456', NULL, 'SHA256');

select * from USER_ACCOUNT

CREATE TABLE STATUS(
id int  primary key,
status_name varchar(100),
is_user_working BIT
);

insert into STATUS(id,status_name,is_user_working) values
(1,'active',1),
(2,'inactive',0);

select * from STATUS

CREATE TABLE user_has_role (
    id INT PRIMARY KEY,
    role_start_time DATETIME,
    role_end_time DATETIME NULL,
    user_account_id INT,
    role_id INT,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

INSERT INTO user_has_role (id, role_start_time, role_end_time, user_account_id, role_id) VALUES 
(1, '2023-01-01 09:00:00', NULL, 1, 1),
(2, '2023-02-01 10:00:00', NULL, 2, 2);
select * from user_has_role

CREATE TABLE user_has_status (
    id INT PRIMARY KEY,
    status_start_time DATETIME,
    status_end_time DATETIME,
    user_account_id INT,
    status_id INT,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);
INSERT INTO user_has_status (id, status_start_time, status_end_time, user_account_id, status_id)
VALUES (1, '2023-01-01 09:00:00', NULL, 1, 1),
       (2, '2023-02-01 10:00:00', NULL, 2, 2);
select * from user_has_status

--2 Delete all the data from each of the tables.

DELETE FROM user_has_status;

DELETE FROM user_has_role;

DELETE FROM status;

DELETE FROM user_account;

DELETE FROM role;
