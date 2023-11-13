set names utf8;
create database db_wave;

use db_wave;

drop table IF EXISTS t_user;
drop table IF EXISTS t_wave;
drop table IF EXISTS t_follow;

create table t_user(userID nvarchar(20),user_name nvarchar(20) not null,user_password nvarchar(20) not null,comment nvarchar(300) default 'こんにちは！',user_img nvarchar(50) default 'def_userimg', primary key(userID));
create table t_wave(waveID serial,userID nvarchar(20) not null,wave_contents nvarchar(1000) not null,imgID1 nvarchar(50) default 'none',imgID2 nvarchar(50) default 'none',imgID3 nvarchar(50) default 'none',imgID4 nvarchar(50) default 'none',posttime datetime not null, primary key(waveID));
create table t_follow(followID int,tofollow nvarchar(20) not null,be_follow nvarchar(20) not null,primary key(followID));
create table t_dm(dmID serial,id1 nvarchar(20) not null,id2 nvarchar(20) not null,flag varchar(1) default "0", primary key(dmID));

insert into t_user (userID,user_name,user_password) values ('aaaaa','aaaaa','aaaaa');
insert into t_user (userID,user_name,user_password) values ('bbbbb','bbbbb','bbbbb');
insert into t_user (userID,user_name,user_password) values ('ccccc','ccccc','ccccc');
insert into t_user (userID,user_name,user_password) values ('ddddd','ddddd','ddddd');
insert into t_user (userID,user_name,user_password) values ('eeeee','eeeee','eeeee');
insert into t_user (userID,user_name,user_password,comment,user_img) values ('take','武豊','take','HAL名古屋に通ってるおじさん','/HF21/image/usericon1.jpg');
insert into t_user (userID,user_name,user_password) values ('yosiman','よしまんTV','yosiman');
insert into t_user (userID,user_name,user_password) values ('shinnichi','♡工藤新一＠蘭しか勝たん♡','kudou');
insert into t_user (userID,user_name,user_password) values ('white__beach__','白浜','sirahama');
insert into t_user (userID,user_name,user_password) values ('hosshi454519119','ホッシー＠APEXガチ勢','kouketu');
insert into t_user (userID,user_name,user_password) values ('masamasa','まさき','murayama');
insert into t_user (userID,user_name,user_password) values ('sakaguCChi','坂口','sakaguti');
insert into t_user (userID,user_name,user_password) values ('hyarahyara','カワカラハラハラ','kawahara');
insert into t_user (userID,user_name,user_password) values ('tosshi3333','ペクシス','hayasi');
insert into t_user (userID,user_name,user_password) values ('tuttakatuttaka','ツッタカダーｗｗ','takada');
insert into t_user (userID,user_name,user_password) values ('TekkaMaki_0141','鉄火巻＠委員長','mori');

insert into t_dm (id1,id2) values ('TekkaMaki_0141','take');



insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('take','先日、第9回はんだ山車まつりに行ってきました！<br>
          山車を引っ張る曳き方の掛け声や囃子方の笛の音色を聞きつつ<br>
          沢山の屋台やキッチンカーでおいしいものを食べては飲んでました！笑<br>
          山車は全部で31台！全部並ぶと結構迫力！<br>
          グッズも多数発売されていました～！<br>
          次回が待ち遠しいですね～。<br>
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
          スクロールテスト用<br>','/HF21/image/DSC_0137.JPG','/HF21/image/1.JPG','/HF21/image/2.JPG','2023-10-28 20:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('take','テストデータです！あああああああああああああああああああああああ'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2023-10-04 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('take','テストデータです！いいいいいいいいいいいいいいいいいいいいいい'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2023-10-24 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','テストデータです！ううううううううううううううううううううう'
                ,'/HF21/image/DSC_0137.JPG','2023-10-12 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,imgID4,posttime) 
        values ('take','テストデータです！ええええええええええええええええええええええええ'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-10-03 15:26:07');


insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('take','テストデータです！おお'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-11-04 12:45:07');


insert into t_wave (userID,wave_contents,imgID1,imgID2,posttime) 
        values ('take','テストデータです！かかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかか'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG','2019-10-11 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('shinnichi','テストデータです！あああああああああああああああああああああああ'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-10-04 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('shinnichi','テストデータです！いいいいいいいいいいいいいいいいいいいいいい'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-10-04 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('masamasa','テストデータです！ううううううううううううううううううううう'
                ,'/HF21/image/DSC_0137.JPG','2019-10-04 15:25:07');

insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,imgID4,posttime) 
        values ('masamasa','テストデータです！ええええええええええええええええええええええええ'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-10-04 15:25:07');


insert into t_wave (userID,wave_contents,imgID1,imgID2,imgID3,posttime) 
        values ('hosshi454519119','テストデータです！おお'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG'
                ,'/HF21/image/2.JPG','2019-10-04 15:25:07');


insert into t_wave (userID,wave_contents,imgID1,imgID2,posttime) 
        values ('hosshi454519119','テストデータです！かかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかかか'
                ,'/HF21/image/DSC_0137.JPG'
                ,'/HF21/image/1.JPG','2019-10-04 15:25:07');


insert into t_follow (followID,tofollow,be_follow) values (1,'take','yamada');
insert into t_follow (followID,tofollow,be_follow) values (2,'yamada','take');
insert into t_follow (followID,tofollow,be_follow) values (3,'take','aaaaa');
insert into t_follow (followID,tofollow,be_follow) values (4,'take','bbbbb');
insert into t_follow (followID,tofollow,be_follow) values (5,'ccccc','take');
insert into t_follow (followID,tofollow,be_follow) values (6,'ddddd','take');
insert into t_follow (followID,tofollow,be_follow) values (7,'eeeee','take');







