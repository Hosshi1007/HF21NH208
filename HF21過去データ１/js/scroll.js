var startPos = 0, winScrollTop = 0;
// scrollイベントを設定
window.addEventListener('scroll', function () {
    winScrollTop = this.scrollY;
    if (winScrollTop >= startPos) {
        // 下にスクロールされた時
        if (winScrollTop >= 100) {
            // 下に100pxスクロールされたら隠す
            document.getElementById('scrollArea').classList.add('hide');
            sita_scroll.style.display = "none";
            sita_scroll.classList.remove("sitakara");
        }
    } else {
        // 上にスクロールされた時
        document.getElementById('scrollArea').classList.remove('hide');
    }
    startPos = winScrollTop;
});

window.addEventListener("scrollend" ,(event) => {
    sita_scroll.style.display = "block";
    sita_scroll.classList.add("sitakara");
});