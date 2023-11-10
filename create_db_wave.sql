set names utf8;
create database db_wave;

use db_wave;

drop table IF EXISTS t_user;
drop table IF EXISTS t_wave;
drop table IF EXISTS t_follow;

create table t_user(userID nvarchar(20),user_name nvarchar(20) not null,user_password nvarchar(20) not null,comment nvarchar(300),user_img nvarchar(50), primary key(userID));
create table t_wave(waveID int,userID nvarchar(20) not null,wave_contents nvarchar(1000) not null,imgID1 nvarchar(50),imgID2 nvarchar(50),imgID3 nvarchar(50),imgID4 nvarchar(50), primary key(waveID));
create table t_follow(followID int,tofollow nvarchar(20) not null,be_follow nvarchar(20) not null,primary key(followID));

insert into t_user (userID,user_name,user_password) values ('yamada','山田太郎','yamada');
insert into t_user (userID,user_name,user_password) values ('aaaaa','aaaaa','aaaaa');
insert into t_user (userID,user_name,user_password) values ('bbbbb','bbbbb','bbbbb');
insert into t_user (userID,user_name,user_password) values ('ccccc','ccccc','ccccc');
insert into t_user (userID,user_name,user_password) values ('ddddd','ddddd','ddddd');
insert into t_user (userID,user_name,user_password) values ('eeeee','eeeee','eeeee');
insert into t_user (userID,user_name,user_password) values ('takahashi','高橋雄太','takahashi');
insert into t_user (userID,user_name,user_password,comment,user_img) values ('take','武豊','take','HAL名古屋に通ってるおじさん','/HF21/image/usericon1.jpg');


insert into t_wave (waveID,userID,wave_contents,imgID1,imgID2,imgID3) 
        values (1,'take','先日、第9回はんだ山車まつりに行ってきました！<br>
          山車を引っ張る曳き方の掛け声や囃子方の笛の音色を聞きつつ<br>
          沢山の屋台やキッチンカーでおいしいものを食べては飲んでました！笑<br>
          山車は全部で31台！全部並ぶと結構迫力！<br>
          グッズも多数発売されていました～！<br>
          次回が待ち遠しいですね～。
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>','/HF21/image/DSC_0137.JPG','/HF21/image/1.JPG','/HF21/image/2.JPG');


          

          







insert into t_follow (followID,tofollow,be_follow) values (1,'take','yamada');
insert into t_follow (followID,tofollow,be_follow) values (2,'yamada','take');
insert into t_follow (followID,tofollow,be_follow) values (3,'take','aaaaa');
insert into t_follow (followID,tofollow,be_follow) values (4,'take','bbbbb');
insert into t_follow (followID,tofollow,be_follow) values (5,'ccccc','take');
insert into t_follow (followID,tofollow,be_follow) values (6,'ddddd','take');
insert into t_follow (followID,tofollow,be_follow) values (7,'eeeee','take');







