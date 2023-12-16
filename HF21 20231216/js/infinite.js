const options = {
    root: document.querySelector('post'),
    threshold: 1 // どれだけ監視された要素が表示されているかを判定する閾値0.1~1の間（割合）
};

(() => {
    const posts = document.getElementById('content1');
   // console.log(posts.lastElementChild);
    const infiniteScrollObserver = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting == false){ //<=コンテンツと交差 == false
                return;      //<=なにもしない
            }
                infiniteScrollObserver.unobserve(entry.target); //監査を外す
                loadContent();
        });
    }, options);

    let i = 0;
    const max = 1000;  //最大表示可能コンテンツ数
	const loadBatchSize = 8; //１回の読み込みで追加するコンテンツ量
    const loadContent = async () => {
        	for (let j = 0; j < loadBatchSize; j++) {
	            posts.insertAdjacentHTML('beforeend','<div id="post" class="loading" style="margin-bottom:70px"><div class="spinner-box"><div class="circle-border"><div class="circle-core"></div></div></div></div>');
	            const response = await fetchdata(); //response変数にデータをフェッチ
	            const newest = await response.text(); //後にコンテンツが最新か比較するための変数

//	            var loadingElement = document.querySelector('.loading');
	            var postElement = document.querySelector('#post.loading');             //データ読み込み終了時
//	            var spinnerBoxElement = loadingElement.querySelector('.spinner-box');   //読み込み中を消す
//	            loadingElement.removeChild(spinnerBoxElement);                          //データ読み込み終了時
	            //読み込み中 == trueの場合
	            if (postElement && j == 0) {
	                // 読み込みが終わるまで待つ
	                await new Promise(resolve => setTimeout(resolve, 500));//解決までに500msセルフディレイ
	                postElement.remove();  //ロードアニメーション削除
	            }
	            else if(postElement){
	            	postElement.remove();
	            }

		        posts.insertAdjacentHTML('beforeend',await response.text()); //コンテンツをHTMLに追加
		        i++;
	//	                // 子要素が10個以上あれば、最初の10個を削除
	//			    if (posts.childElementCount >= 40) {
	//			        for (let k = 0; k < loadBatchSize; k++) {
	//			            posts.removeChild(posts.firstElementChild);
	//			        }
	//			    }

				if (newest === '<div id="post" class="newest">最新のコンテンツは以上です</div>') {
					i = max;
					return;
				}
			}
            //ｎ＋１０件目の要素を監視する
            if (i < max) {
                infiniteScrollObserver.observe(posts.lastElementChild);                // posts.lastElementChild.style.backgroundColor = 'lightblue'; // 監視対象になった要素の背景色を変更
            }
    };
        loadContent();
})();

//content2

// const content2 = document.getElementById('contents2');
// content2.addEventListener('click', function() {
// (() => {
//     const posts = document.getElementById('content2');
//     console.log(posts.lastElementChild);
//     const infiniteScrollObserver = new IntersectionObserver(entries => {
//         entries.forEach(entry => {
//             if (entry.isIntersecting == false){ //<=コンテンツと交差 == false
//                 return;      //<=なにもしない
//             }
//                 infiniteScrollObserver.unobserve(entry.target); //監査を外す
//                 loadContent();
//         });
//     }, options);

//     let k = 0;
//     const max = 1000;  //最大表示可能コンテンツ数
// 	const loadBatchSize = 8; //１回の読み込みで追加するコンテンツ量
//     const loadContent = async () => {
//         	for (let j = 0; j < loadBatchSize; j++) {
// 	            posts.insertAdjacentHTML('beforeend','<div id="post" class="loading" style="margin-bottom:70px"><div class="spinner-box"><div class="circle-border"><div class="circle-core"></div></div></div></div>');
// 	            const response2 = await fetchdata2(); //response変数にデータをフェッチ
// 	            const newest = await response2.text(); //後にコンテンツが最新か比較するための変数
// 				console.log('k,'+k)
// //	            var loadingElement = document.querySelector('.loading');
// 	            var postElement = document.querySelector('#post.loading');             //データ読み込み終了時
// //	            var spinnerBoxElement = loadingElement.querySelector('.spinner-box');   //読み込み中を消す
// //	            loadingElement.removeChild(spinnerBoxElement);                          //データ読み込み終了時
// 	            //読み込み中 == trueの場合
// 	            if (postElement && j == 0) {
// 	                // 読み込みが終わるまで待つ
// 	                await new Promise(resolve => setTimeout(resolve, 500));//解決までに500msセルフディレイ
// 	                postElement.remove();  //ロードアニメーション削除
// 	            }
// 	            else if(postElement){
// 	            	postElement.remove();
// 	            }

// 		        posts.insertAdjacentHTML('beforeend',await response2.text()); //コンテンツをHTMLに追加
// 		        k++;
// 	//	                // 子要素が10個以上あれば、最初の10個を削除
// 	//			    if (posts.childElementCount >= 40) {
// 	//			        for (let k = 0; k < loadBatchSize; k++) {
// 	//			            posts.removeChild(posts.firstElementChild);
// 	//			        }
// 	//			    }

// 				if (newest === '<div id="post" class="newest">最新のコンテンツは以上です</div>') {
// 					k = max;
// 					return;
// 				}
// 			}
//             //ｎ＋１０件目の要素を監視する
//             if (k < max) {
//                 infiniteScrollObserver.observe(posts.lastElementChild);                // posts.lastElementChild.style.backgroundColor = 'lightblue'; // 監視対象になった要素の背景色を変更
//             }
//     };
//         loadContent();
// })()

// });
