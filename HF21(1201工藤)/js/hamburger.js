function btnCtr() {
 	const checkbox = document.getElementById('cp_toggle04');
 	const menu = document.querySelector('.cp_menu');
	const body = document.body;
	const header = document.getElementById('scrollArea');
	if (checkbox.checked) {
	  body.classList.add('menu-open');
	  body.style.overflow = 'hidden';
	  header.style.transition = '.0s';
	  header.style.backdropFilter = 'initial';
	  header.style.WebkitbackdropFilter = 'initial';
	  checkbox.checked=true;
	}
}
function backdropfunc() {
	const header = document.getElementById('scrollArea');
	 header.style.backdropFilter = 'blur(28.5px)';
	 header.style.WebkitbackdropFilter = 'blur(28.5px)';

}
document.addEventListener('click', function (event) {
	const checkbox = document.getElementById('cp_toggle04');
 	const menu = document.querySelector('.cp_menu');
	const body = document.body;
	const header = document.getElementById('scrollArea');
  // クリックされた要素がメニューの外側でかつcheckboxがcheckedならば
  if (!menu.contains(event.target) && checkbox.checked == true && !checkbox.contains(event.target)) {
	  	console.log("if");
	  	body.classList.remove('menu-open');
	  	body.style.overflow = 'auto';
	  	checkbox.checked=false;
		header.style.transition = '.5s ease';
		setTimeout(() => {backdropfunc()}, 180);//ディレイかけないとハンバーガーメニューなぜかバグる
  }
});