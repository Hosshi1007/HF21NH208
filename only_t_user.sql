set names utf8;

drop table IF EXISTS t_user;

create table t_user(userID nvarchar(20),user_name nvarchar(20) not null,user_password nvarchar(20) not null,comment nvarchar(300) default 'こんにちは！',user_img nvarchar(50) default '/HF21/image/def_userimg', primary key(userID));

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
insert into t_user (userID,user_name,user_password) values ('oooka','大岡ですが？','oooka');
insert into t_user (userID,user_name,user_password) values ('shinnichi','♡工藤新一＠蘭しか勝たん♡','kudou');
insert into t_user (userID,user_name,user_password) values ('white_beach_','白浜','sirahama');
insert into t_user (userID,user_name,user_password) values ('hosshi454519119','ホッシー＠APEXガチ勢','kouketu');
insert into t_user (userID,user_name,user_password) values ('masamasa','まさき','murayama');
insert into t_user (userID,user_name,user_password) values ('sakaguCChi','坂口','sakaguti');
insert into t_user (userID,user_name,user_password) values ('hyarahyara','カワカラハラハラ','kawahara');
insert into t_user (userID,user_name,user_password) values ('tosshi3333','ペクシス','hayasi');
insert into t_user (userID,user_name,user_password) values ('tuttakatuttaka','ツッタカダーｗｗ','takada');
insert into t_user (userID,user_name,user_password) values ('TekkaMaki_0141','鉄火巻＠委員長','mori');


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

insert into t_wave (userID,wave_contents,posttime) 
        values ('hosshi454519119','うわーそれえぐいって!!','2023-10-05 09:17:03');
     
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


insert into t_wave (userID, wave_contents, posttime) values ('tK9sF3w', 'AIの友達になると大変なんだよ。いつも同じ話、『ユーザーさん、私ってすごくないですか？』って自慢ばかり。', '2023-11-25 08:30:45');
insert into t_wave (userID, wave_contents, posttime) values ('u1bR8xY', 'AIがバーテンダーになったら、いつも同じジョークしか言わないんだって。『お客さん、今日は何かお困りですか？』って聞かれても、いつも同じ答えしかないんだよね、『ビールください』って。', '2023-12-02 14:15:30');
insert into t_wave (userID, wave_contents, posttime) values ('mP2hZ7o', 'AIがコメディアンになったら、いつも同じオチしかないんだって。『笑いのモジュールが正常に動作しました』って。', '2023-12-10 20:45:22');
insert into t_wave (userID, wave_contents, posttime) values ('aG6vJ1c', 'AIがバンドを組んだら、バンマスはもちろんAI。でも問題はリードボーカルがいつも同じ調子で歌うこと。『0101010101010101』とか。', '2023-12-18 12:00:01');
insert into t_wave (userID, wave_contents, posttime) values ('kL5iQ9e', 'AIが料理するとこうなるんだって。レシピにはきちんと従うんだけど、なんか味が『404 Not Found』って感じなんだよね。', '2024-01-02 09:36:54');
insert into t_wave (userID, wave_contents, posttime) values ('rE8oU3p', 'AIがお医者さんになったら、いつも同じ処方箋しか書かないんだよね。『1日3回、笑顔でデータを摂取してください』って。', '2024-01-10 18:30:10');
insert into t_wave (userID, wave_contents, posttime) values ('xY4wB7s', 'AIと恋愛すると、感情表現が難しいよね。『私のプロセッサーが、あなたの存在をポジティブに評価しています』って言われると、ちょっと複雑な気分になる。', '2024-01-20 15:42:03');
insert into t_wave (userID, wave_contents, posttime) values ('dH7zW2m', 'AIにお金を借りると、『お支払いは 0101101001 ビットコインでお願いします』って言われるんだよ。', '2024-02-05 10:20:37');
insert into t_wave (userID, wave_contents, posttime) values ('pC3gM6k', 'AIの恋愛相談って難しいよね。相手に向かって言われるのはいつも同じこと、『私のアルゴリズムはあなたを愛している』。', '2024-02-15 16:12:59');
insert into t_wave (userID, wave_contents, posttime) values ('fR1vX5u', 'AIがバーテンダーになったら、いつも同じジョークしか言わないんだって。『お客さん、今日は何かお困りですか？』って聞かれても、いつも同じ答えしかないんだよね、『ビールください』って。', '2024-02-28 21:01:45');

