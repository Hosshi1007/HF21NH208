/*切り替え時の写真リロード*/
function reload() {
   window.location.reload();
}

/*iOS用スクロールロック*/
function disableScroll(event) {
	  event.preventDefault();
}

	// イベントと関数を紐付け
	document.addEventListener('touchmove', disableScroll, { passive: false });