<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//Java
%>
<html lang="ja">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width" />
		<meta name="viewport" content="initial-scale=1, viewport-fit=cover" />
		<title>Discovery</title>
		<!-- ブラウザ表示favicon -->
		<link rel="icon" type="image/png" href="icon/icon-16x16.png" sizes="16x16"/>
		<!-- iphone表示favicon -->
		<link rel="apple-touch-icon" href="icon/apple-touch-icon.png" sizes="180x180"/>
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="css/discovery/reset.css" />
		<link rel="stylesheet" type="text/css" href="css/discovery/format.css" />
		<link rel="stylesheet" type="text/css" href="css/discovery/discovery.css" />
		<link rel="stylesheet" type="text/css" href="css/discovery/tab.css" />
		<!-- Slick.jsのCSS -->
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
		<link rel="stylesheet" type="text/css" href="css/discovery/slick_my.css" />
		<!-- Slick.jsのJS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>

	<body>

		<!--- スマートフォン用タブ--->
		<header class="smart-header">
			<div class="head">
				<form method="get" action="results.html" class="search">
					<label><input type="text" placeholder="気になるワード" /></label>
					<button type="submit" aria-label="検索"></button>
				</form>
			</div>
			<div class="tabs">
				<div class="tab-buttons">
					<span class="content1" onclick="reload()">画像</span>
					<span class="content2">文字</span>
					<div id="lamp" class="content1"></div>
				</div>
			</div>
		</header>

		<!--スマートフォン用メイン -->
		<main class="smart-main">
			<div class="tab-content">
				<!--写真+文字 -->
				<div class="content1">
					<ul class="slider-5" id="js-slider-5">
						<li><img src="image/test_image/img_11.jpg" alt="" /></li>
						<li><img src="image/test_image/img_01.jpg" alt="" /></li>
						<li><img src="image/test_image/img_22.jpg" alt="" /></li>
						<li><img src="image/test_image/img_02.jpg" alt="" /></li>
						<li><img src="image/test_image/img_33.jpg" alt="" /></li>
						<li><img src="image/test_image/img_03.jpg" alt="" /></li>
					</ul>
					<div class="dots-5"></div>
				</div>
				<div class="content2">
					<div class="post swipe-item"><a href="wave.html">sample1</a></div>
					<div class="post swipe-item"><a href="wave.html">sample2</a></div>
					<div class="post swipe-item"><a href="wave.html">sample3</a></div>
					<div class="post swipe-item"><a href="wave.html">sample4</a></div>
					<div class="post swipe-item"><a href="wave.html">sample5</a></div>
					<div class="post swipe-item"><a href="wave.html">sample6</a></div>
					<div class="post swipe-item"><a href="wave.html">sample7</a></div>
					<div class="post swipe-item"><a href="wave.html">sample8</a></div>
					<div class="post swipe-item"><a href="wave.html">sample9</a></div>
					<div class="post swipe-item"><a href="wave.html">sample10</a></div>
					<div class="post swipe-item"><a href="wave.html">sample11</a></div>
					<div class="post swipe-item"><a href="wave.html">sample12</a></div>
					<div class="post swipe-item"><a href="wave.html">sample13</a></div>
					<div class="post swipe-item"><a href="wave.html">sample14</a></div>
					<div class="post swipe-item"><a href="wave.html">sample15</a></div>
					<div class="post swipe-item"><a href="wave.html">sample16</a></div>
					<div class="post swipe-item"><a href="wave.html">sample17</a></div>
					<div class="post swipe-item"><a href="wave.html">sample18</a></div>
					<div class="post swipe-item"><a href="wave.html">sample19</a></div>
					<div class="post swipe-item"><a href="wave.html">sample20</a></div>
				</div>
			</div>
			<!-- JS -->
			<script src="js/discovery/discovery.js"></script>
			<script src="js/discovery/tab.js"></script>
			<!-- Slick.jsのJS -->
			<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
			<script src="js/discovery/slick_my.js"></script>
			<!-- スライド削除のJS -->
			<script>
				var tsJqSwipeX = -1;
				var tsJqSwipeY = -1;

				$(function () {
					// スワイプ処理
					$(".swipe-item").bind("touchstart", function () {
						tsJqSwipeX = event.changedTouches[0].pageX;
						tsJqSwipeY = event.changedTouches[0].pageY;
					});
					$(".swipe-item").bind("touchend", function () {
						tsJqSwipeX = -1;
						flag = 0;
					});
					$(".swipe-item").bind("touchmove", function () {
						if (Math.abs(event.changedTouches[0].pageY - tsJqSwipeY) > 10)
							tsJqSwipeX = -1;
						if (
							tsJqSwipeX != -1 &&
							Math.abs(event.changedTouches[0].pageX - tsJqSwipeX) > 35
						) {
							tsJqSwipeX = -1;
							// スワイプられた時の処理
							$(this).css("background-color", "#cd0000");
							$(this).slideUp("slow");
							/*投稿の追加を記入*/
						}
					});
				});
			</script>
		</main>

		<!--スマートフォン用ボトムメニュー -->
		<ul class="bottom-menu">
			<li><a href="home.html"> <img src="image/menu1.png" alt="ホーム" /></a></li>
			<li><a href="search.html"> <img src="image/menu2.png" alt="検索" /></a></li>
			<li><a href="notice.html"> <img src="image/menu3.png" alt="通知" /></a></li>
			<li><a href="dm.html"> <img src="image/menu4.png" alt="dm" /></a></li>
			<!-- プロフィール画像がなしの場合menu5.png -->
			<li><a href="profile.html"><img src="image/menu5.png" alt="プロフィール"/></a></li>
		</ul>

	</body>
</html>
