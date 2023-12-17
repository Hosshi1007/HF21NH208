set names utf8;
create database db_wave;

use db_wave;

drop table IF EXISTS t_user;
drop table IF EXISTS t_wave;
drop table IF EXISTS t_follow;
drop table IF EXISTS t_dm;

create table t_user(userID nvarchar(20),user_name nvarchar(20) not null,user_password nvarchar(20) not null,comment nvarchar(300) default 'こんにちは！',user_img nvarchar(50) default '/HF21/image/def_userimg', primary key(userID));
create table t_wave(waveID serial,userID nvarchar(20) not null,wave_contents nvarchar(1000) not null,imgID1 nvarchar(50) default 'none',imgID2 nvarchar(50) default 'none',imgID3 nvarchar(50) default 'none',imgID4 nvarchar(50) default 'none',posttime datetime not null, primary key(waveID)) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
create table t_follow(followID int,tofollow nvarchar(20) not null,be_follow nvarchar(20) not null,primary key(followID));
create table t_dm(dmID serial,name nvarchar(50) not null,follower nvarchar(50) not null,time nvarchar(50) not null,text varchar(300), primary key(dmID));


insert into t_user (userID, user_name, user_password) values ('u1bR8xY', '蒼天の彩', 'u1bR8xY');
insert into t_user (userID, user_name, user_password) values ('tK9sF3w', '銀河の夢幻', 'tK9sF3w');
insert into t_user (userID, user_name, user_password) values ('mP2hZ7o', '紫陽花の雫', 'mP2hZ7o');
insert into t_user (userID, user_name, user_password) values ('aG6vJ1c', '翡翠の舞踏', 'aG6vJ1c');
insert into t_user (userID, user_name, user_password) values ('kL5iQ9e', '月光の旋律', 'kL5iQ9e');
insert into t_user (userID, user_name, user_password) values ('rE8oU3p', '蒼穹の彩虹', 'rE8oU3p');
insert into t_user (userID, user_name, user_password) values ('xY4wB7s', '紅蓮の煌めき', 'xY4wB7s');
insert into t_user (userID, user_name, user_password) values ('dH7zW2m', '薔薇の微笑み', 'dH7zW2m');
insert into t_user (userID, user_name, user_password) values ('pC3gM6k', '青空のノクターン', 'pC3gM6k');
insert into t_user (userID, user_name, user_password) values ('fR1vX5u', '幻想の魔法師', 'fR1vX5u');


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

insert into t_wave (userID,wave_contents,posttime) 
        values ('TekkaMaki_0141','今日のおつまみ、なににしよっかなー','2023-10-04 20:50:07');

insert into t_wave (userID,wave_contents,posttime) 
        values ('TekkaMaki_0141','酒が止まらないぜー','2023-10-04 21:10:40');

insert into t_wave (userID,wave_contents,posttime)  
        values ('TekkaMaki_0141','ストゼロ最高だぜー','2023-10-04 21:50:32');

insert into t_wave (userID,wave_contents,posttime) 
        values ('TekkaMaki_0141','あ゙ーー!!!!!!!!!!!!!!!!!!!!!!<br>
        あ゙だまい゙でーーーーーーーーーー!!!!!!!<br>
        の゙み゙すぎたーーーーーーーーーーーーーーーーーー!!!!!!!','2023-10-05 09:34:16');

insert into t_wave (userID,wave_contents,posttime) values ('hosshi454519119','うわーそれえぐいって!!','2023-10-05 09:17:03');
     
insert into t_wave (userID,wave_contents,posttime) 
        values ('hosshi454519119','普通に遅刻した','2023-10-05 09:21:04');

insert into t_wave (userID,wave_contents,posttime) 
        values ('hosshi454519119','え!?それってどういう.....','2023-10-05 10:30:29');

insert into t_wave (userID,wave_contents,posttime) 
        values ('hosshi454519119','あーなるほど、そういうことね','2023-10-05 10:31:18');

insert into t_wave (userID,wave_contents,posttime) 
        values ('take','丸亀しか勝たん!!!','2023-10-05 12:41:42');

insert into t_wave (userID,wave_contents,posttime) 
        values ('take','ういーす','2023-10-06 09:10:11');

insert into t_wave (userID,wave_contents,posttime) 
        values ('take','まじで、だるい','2023-10-06 09:16:59');

insert into t_wave (userID,wave_contents,posttime)  
        values ('take','肉食いに行くわ','2023-10-06 12:39:08');

insert into t_wave (userID,wave_contents,posttime) 
        values ('shinnichi','120人全員片岡利幸になった<br>
ウケル','2023-10-05 22:33:43');

insert into t_wave (userID,wave_contents,posttime)  
        values ('shinnichi','とてつもなく腹痛い','2023-10-06 08:22:34');

insert into t_wave (userID,wave_contents,posttime) 
        values ('shinnichi','胃に穴空いたわ','2023-10-06 11:04:35');

insert into t_wave (userID,wave_contents,posttime) 
        values ('shinnichi','過敏性腸症候群ウヒョーー','2023-10-06 11:09:02');

insert into t_wave (userID,wave_contents,posttime) 
        values ('tuttakatuttaka','うーん','2023-10-05 12:43:15'); 

insert into t_wave (userID,wave_contents,posttime) 
        values ('tuttakatuttaka','やばい','2023-10-05 12:51:44');  

insert into t_wave (userID,wave_contents,posttime) 
        values ('tuttakatuttaka','なんとかギリ....','2023-10-05 12:57:50'); 

insert into t_wave (userID,wave_contents,posttime) 
        values ('tuttakatuttaka','丸亀時間内に行って戻ってこれた!!!!!!!','2023-10-05 12:59:21'); 

insert into t_wave (userID,wave_contents,posttime) 
        values ('tosshi3333','ツイフェミを馬鹿にしてる貴方も、<br>
                              いつ何時どんな経緯で「仲間」からツイフェミ扱いされたり、<br>
                              本当にツイフェミと化すか知れたモノではないわよ。','2023-10-17 13:35:41'); 

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/10.JPG','2023-11-05 15:30:01');
    
insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/11.JPG','2023-11-05 15:30:02');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/12.JPG','2023-11-05 15:30:03');

insert into t_wave (userID,wave_contents,imgID1,posttime)  
        values ('take','','/HF21/image/13.JPG','2023-11-05 15:30:04');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/14.JPG','2023-11-05 15:30:05');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/15.JPG','2023-11-05 15:30:06');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/16.JPG','2023-11-05 15:30:07');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/17.JPG','2023-11-05 15:30:08');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/18.JPG','2023-11-05 15:30:09');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/19.JPG','2023-11-05 15:30:10');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('take','','/HF21/image/20.png','2023-11-05 15:30:11');

insert into t_wave (userID,wave_contents,posttime) 
        values ('hosshi454519119','性別テーブルのフィールドIDがsexとか信じられない!<br>
                              そこは普通genderでしょ!?<br>
                              やっぱりオスは性的な事しか考えてない下劣な生き物なんだわ。','2023-11-13 14:16:34');

insert into t_wave (userID,wave_contents,imgID1,posttime) 
        values ('hosshi454519119','祝！創業日記念！うどん札50枚セットを10名様にプレゼントします！<br>
                                 応募条件　　アカウントのフォローとこのwaveをRT<br>
                                 応募期間　　11月21日13時〜12月05日13時<br>
                                 当選連絡　　DMにて追ってご連絡をします。DMが受け取れるようにしてください。'
                                 ,'/HF21/image/3.JPG','2023-11-21 12:45:00');

insert into t_follow (followID,tofollow,be_follow) values (1,'take','yamada');
insert into t_follow (followID,tofollow,be_follow) values (2,'yamada','take');
insert into t_follow (followID,tofollow,be_follow) values (3,'take','aaaaa');
insert into t_follow (followID,tofollow,be_follow) values (4,'take','bbbbb');
insert into t_follow (followID,tofollow,be_follow) values (5,'ccccc','take');
insert into t_follow (followID,tofollow,be_follow) values (6,'ddddd','take');
insert into t_follow (followID,tofollow,be_follow) values (7,'eeeee','take');







