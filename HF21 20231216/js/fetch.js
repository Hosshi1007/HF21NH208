let userdata = 0;
let images = new Array(4);
// loadjs関数 ＝  非同期関数
async function loadjson() {
  try {
    const response = await fetch('wave.json');
    const jsonData = await response.json();
    if(userdata < jsonData.length){
		let waveID = jsonData[userdata].waveID;//0
	    let username = jsonData[userdata].username;//1
	    let userid = jsonData[userdata].userid;//2
	    let usericon = jsonData[userdata].user_img;//3
	    let time = jsonData[userdata].time;//4
	    let maincontent = jsonData[userdata].maincontent;//5
		let imgID1 = jsonData[userdata].imgID1;//6
		let imgID2 = jsonData[userdata].imgID2;//7
		let imgID3 = jsonData[userdata].imgID3;//8
		let imgID4 = jsonData[userdata].imgID4;//9
		let posttime = jsonData[userdata].posttime;//10
	    let heart = jsonData[userdata].heart;//11
		let rewave = jsonData[userdata].rewave;//12
	    userdata++;
	    let error = 0;
	    return {waveID, username, userid, usericon, time, posttime, imgID1,imgID2,imgID3,imgID4,maincontent, heart, rewave, error};
    }
    else{
		let error = 1;
		return{error}
	}
  } catch (error) {
    console.error('ファイルの読み込み中にエラーが発生しました', error);
    throw error;
  }
}

// fetchDummy関数  =  非同期関数
window.fetchdata = async url => {
  try {
    var jsonData = await loadjson();
    let error = jsonData.error;
    if (error == 0) {	
	    // error変数が0の場合の処理
		let waveID = jsonData.waveID;
	    let username = jsonData.username;			//ユーザー名取得
	    let userid = jsonData.userid;				//ユーザーid取得
	    let usericon = jsonData.usericon;			//ユーザーiconディレクトリ取得
	    let time = jsonData.time;					//発信時間取得
	    let maincontent = jsonData.maincontent;		//メインコンテンツ取得
		let imgID1 = jsonData.imgID1;				//１枚目の画像取得
		let imgID2 = jsonData.imgID2;				//２枚目の画像取得
		let imgID3 = jsonData.imgID3;				//３枚目の画像取得
		let imgID4 = jsonData.imgID4;				//４枚目の画像取得
		if(imgID1 != 'none'){
			console.log('１枚目ありました');
			images[0] =  '<div class="hsp3p"></div>' +
			'<div class="main_contents_contents_image">'+
			'<div class="main_contents_contents_image_box1">'+
			'<img src="'+imgID1+'" alt="image1" class="zoom">';//img1枚目がある場合
			if(imgID2 != 'none'){
				images[1] =  '<img src="'+imgID2+'" alt="image1" class="zoom">'
				             +'</div>';//img2枚目がある場合
				if(imgID3 != 'none'){
					images[2] =  '<div class="main_contents_contents_image_box1">'+
								 '<img src="'+imgID3+'" alt="image1" class="zoom">';//img3枚目がある場合
					if(imgID4 != 'none'){
						images[3] =  '<img src="'+imgID4+'" alt="image1" class="zoom">'+
										'</div>'+
										'</div>';//img4枚目がある場合
					}
					else{
						images[3] = '</div>'+
									'</div>';//img4枚目がない場合
					}
				}
				else{
					images[2] = '</div>';//img3枚目がない場合
					images[3] = '';
				}
			}
			else{
				images[1] = '</div>'+
							'</div>'; //img2枚目がない場合
				images[2] = '';
				images[3] = '';

			}
		}
		else{
			console.log("1枚目ありません");
			images[0] = '';//img1枚目がない場合
			images[1] = '';
			images[2] = '';
			images[3] = '';
		}
		console.log('１枚目'+images[0]+'２枚目'+images[1]+'３枚目'+images[2]+'４枚目'+images[3]);
		let posttime = jsonData.posttime;			//ポスト時間を取得
	    let heart = jsonData.heart;					//いいね数取得
		let rewave = jsonData.rewave;				//リウェーブ数取得
		//console.log(waveID,username,userid,usericon,time,maincontent,imgID1,imgID2,imgID3,imgID4,posttime,heart,rewave);
	    let content = 								//コンテンツ内容定義
	      '<div id="post">' +
	      '<div class="hsp12p"></div>' +
	      '<div class="xyz">' +
	      '<div class="picture"><img class="maru" src="'+ usericon +'" alt="picture"></div>' +
	      '<div class="y">' +
	      '<div class="z">' +
	      '<div class="username">' + username + '</div>' +
	      '<div class="userid">@'+ userid +'</div>' +
	      '<div class="timesago">·'+ time +'</div>' +
	      '</div>' +
	      '<div class="hsp3p"></div>' +
	      '<div class="maincontent">'+ maincontent +'</div>' +
		  images[0]+
		  images[1]+
		  images[2]+
		  images[3]+
	      '<div class="hsp12p"></div>' +
	      '<div class="hasamu"><div class="icons">💭</div><div class="icons"><img src="image/heart.png">'+heart+'</div><div class="icons">'+rewave+'</div><div class="icons">□</div><div class="icons">…</div></div>' +
	      '</div>' +
	      '</div>' +
	      '<div class="hsp6p"></div>' +
	      '</div>';
		  console.log(content);
	    return { text: async () => content};		//content変数をinfinite.jsへreturn;
    }
    else if(error != 0){
		// error変数が1の場合の処理
		let content = '<div id="post" class="newest">最新のコンテンツは以上です</div>';
		return { text: async () => content};
	}
  } catch (error) {
    console.error('データの取得中にエラーが発生しました', error);
    return { text: async () => '' };
  }
};
//content2
// let userdata2 = 0;
// async function loadjson() {
// 	try {
// 	  const response2 = await fetch('js/content2.json');
// 	  const jsonData = await response2.json();
// 	  if(userdata2 < jsonData.length){
// 		  let username = jsonData[userdata2].username;
// 		  let userid = jsonData[userdata2].userid;
// 		  let usericon = jsonData[userdata2].usericon;
// 		  let time = jsonData[userdata2].time;
// 		  let maincontent = jsonData[userdata2].maincontent;
// 		  let heart = jsonData[userdata2].heart;
// 		  console.log(username);
// 		  console.log('JSONデータ:', jsonData);
// 		  userdata2++;
// 		  let error = 0;
// 		  return { username, userid, usericon, time, maincontent, heart, error};
// 	  }
// 	  else{
// 		  let error = 1;
// 		  return{error}
// 	  }
// 	} catch (error) {
// 	  console.error('ファイルの読み込み中にエラーが発生しました', error);
// 	  throw error;
// 	}
//   }
  
//   // fetchDummy関数  =  非同期関数
//   window.fetchdata2 = async url => {
// 	try {
// 	  var jsonData = await loadjson();
// 	  let error = jsonData.error;
// 	  if (error == 0) {	
// 		  // error変数が0の場合の処理
// 		  let username = jsonData.username;			//ユーザー名取得
// 		  let userid = jsonData.userid;				//ユーザーid取得
// 		  let usericon = jsonData.usericon;			//ユーザーiconディレクトリ取得
// 		  let time = jsonData.time;					//発信時間取得
// 		  let maincontent = jsonData.maincontent;		//メインコンテンツ取得
// 		  let heart = jsonData.heart;					//いいね数取得
// 		  let content = 								//コンテンツ内容定義
// 			'<div id="post">' +
// 			'<div class="hsp12p"></div>' +
// 			'<div class="xyz">' +
// 			'<div class="picture"><img class="maru" src="'+ usericon +'" alt="picture"></div>' +
// 			'<div class="y">' +
// 			'<div class="z">' +
// 			'<div class="username">' + username + '</div>' +
// 			'<div class="userid">@'+ userid +'</div>' +
// 			'<div class="timesago">·'+ time +'</div>' +
// 			'</div>' +
// 			'<div class="hsp3p"></div>' +
// 			'<div class="maincontent">'+ maincontent +'</div>' +
// 			'<div class="hsp3p"></div>' +
// 			'<div class="hasamu"><div class="icons">💭</div><div class="icons"><img src="image/heart.png"></div><div class="icons">◯</div><div class="icons">□</div><div class="icons">…</div></div>' +
// 			'</div>' +
// 			'</div>' +
// 			'<div class="hsp6p"></div>' +
// 			'</div>';
// 		  return { text: async () => content};		//content変数をinfinite.jsへreturn;
// 	  }
// 	  else if(error != 0){
// 		  // error変数が1の場合の処理
// 		  let content = '<div id="post" class="newest">最新のコンテンツは以上です</div>';
// 		  return { text: async () => content};
// 	  }
// 	} catch (error) {
// 	  console.error('データの取得中にエラーが発生しました', error);
// 	  return { text: async () => '' };
// 	}
//   };