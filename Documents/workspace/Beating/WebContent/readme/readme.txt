
use testdb_b;

CREATE TABLE MEMBER
(
    `id`     VARCHAR(45)    NOT NULL, 
    `pw`     VARCHAR(100)    NOT NULL, 
    `name`   VARCHAR(45)    NOT NULL, 
    `addr`   VARCHAR(45)    NOT NULL,  
    `phone`  VARCHAR(45)    NOT NULL, 
    `power`  INT            NOT NULL, 
    PRIMARY KEY (id)
);

create table meeting(
	meetingID int , 
	meetingTitle varchar(50),
	userID varchar(20), 
	meetingDate datetime,
	meetingContent varchar(2048), 
	meetingAvailable int, 
	primary key(meetingID)
);

create table boardComment(
	commentID int ,
	userID varchar(20),
	commentContent varchar(2048),
	commentDate datetime,
	commentAvailable int
);

create table Compeshedule(
	compeNum int,
	compeTitle varchar(30),
	compeDate datetime,
	compeContent varchar(2048),
	compeAvailable int,
	primary key (compeNum)
);