var startPos = 0, winScrollTop = 0;
// scrollイベントを設定
window.addEventListener('scroll', function () {
    winScrollTop = this.scrollY;
    if (winScrollTop >= startPos) {
        // 下にスクロールされた時
        if (winScrollTop >= 100) {
            // 下に100pxスクロールされたら隠す
            document.getElementById('scrollArea').classList.add('hide');
        }
    } else {
        // 上にスクロールされた時
        document.getElementById('scrollArea').classList.remove('hide');
    }
    startPos = winScrollTop;
});

loading = document.getElementById("loading");
// loading.style.display = 'none';
newest = document.getElementById("newest");
const allHeight = Math.max(
	document.body.scrollHeight, document.documentElement.scrollHeight,
	document.body.offsetHeight, document.documentElement.offsetHeight,
	document.body.clientHeight, document.documentElement.clientHeight
);
const mostBottom = allHeight - window.innerHeight;
window.addEventListener('scroll', ()=> {
	const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	if(scrollTop == 0){
    // 最上部に到達したときに実行する処理
	console.log("top");
	}
	else if (scrollTop >= mostBottom) {
    // 最下部に到達したときに実行する処理
	console.log("sita")
	}
});