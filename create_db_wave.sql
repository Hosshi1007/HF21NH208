create database db_wave;

use db_wave;

drop table IF EXISTS t_user;
drop table IF EXISTS t_wave;
drop table IF EXISTS t_follow;

create table t_user(userID nvarchar(20),user_name nvarchar(20) not null,user_password nvarchar(20) not null,comment nvarchar(200),user_img nvarchar(20) not, primary key(userID));
create table t_wave(waveID int,userID nvarchar(20) not null,wave_contents nvarchar(120) not null,imgID int, primary key(waveID));
create table t_follow(followID int,tofollow nvarchar(20) not null,be_follow nvarchar(20) not null,primary key(followID));

insert into t_user (userID,user_name,user_password) values ('yamada','山田太郎','yamada');
insert into t_user (userID,user_name,user_password) values ('aaaaa','aaaaa','aaaaa');
insert into t_user (userID,user_name,user_password) values ('bbbbb','bbbbb','bbbbb');
insert into t_user (userID,user_name,user_password) values ('ccccc','ccccc','ccccc');
insert into t_user (userID,user_name,user_password) values ('ddddd','ddddd','ddddd');
insert into t_user (userID,user_name,user_password) values ('eeeee','eeeee','eeeee');
insert into t_user (userID,user_name,user_password) values ('takahashi','高橋雄太','takahashi');
insert into t_user (userID,user_name,user_password) values ('take','武豊','take');


insert into t_wave (waveID,userID,wave_contents,imgID) values (1,'take','本日は半田山車祭りに行ってきました！！',1);
insert into t_wave (waveID,userID,wave_contents,imgID) values (2,'take','公式グッズにはTシャツやパーカーがあります！',2);


insert into t_follow (followID,tofollow,be_follow) values (1,'take','yamada');
insert into t_follow (followID,tofollow,be_follow) values (2,'yamada','take');
insert into t_follow (followID,tofollow,be_follow) values (3,'take','aaaaa');
insert into t_follow (followID,tofollow,be_follow) values (4,'take','bbbbb');
insert into t_follow (followID,tofollow,be_follow) values (5,'ccccc','take');
insert into t_follow (followID,tofollow,be_follow) values (6,'ddddd','take');
insert into t_follow (followID,tofollow,be_follow) values (7,'eeeee','take');







