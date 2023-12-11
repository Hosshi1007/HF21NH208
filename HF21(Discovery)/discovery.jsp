<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%

	int count=1;

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

						<% for(int i=1;i<6;i++) { %>
							<li><img src="image/test_image/img_<%= i %>.jpg" alt="画像読み込みエラー(<%= i %>)" /></li>
							<% System.out.println("img_" + i + ".jpg読み込み"); %>
						<% } %>

					</ul>
				</div>
				<div class="content2 slyd">
					<% for(count=1;count<6;count++) { %>
						<div class="post swipe-item"><a href="wave.html">sample<%= count %></a></div>
					<% } %>
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
				// スワイプ処理
				$(function () {
					$(document).on("touchstart", ".swipe-item", function () {
						tsJqSwipeX = event.changedTouches[0].pageX;
						tsJqSwipeY = event.changedTouches[0].pageY;
					});
					$(document).on("touchend", ".swipe-item", function () {
						tsJqSwipeX = -1;
						flag = 0;
					});
					$(document).on("touchmove", ".swipe-item", function () {
						if (Math.abs(event.changedTouches[0].pageY - tsJqSwipeY) > 10)
							tsJqSwipeX = -1;
						if (
							tsJqSwipeX != -1 &&
							Math.abs(event.changedTouches[0].pageX - tsJqSwipeX) > 35
						) {
							tsJqSwipeX = -1;
							 // スワイプされた時の処理
							 $(this).css("background-color", "#cd0000");
							 $(this).slideUp("slow");
							 $(".slyd").append('<div class="post swipe-item"><a href="wave.html">sample100</a></div>');
						}
					});
				});
			</script>
		</main>

		<!--スマートフォン用ボトムメニュー -->
		<ul class="bottom-menu">
			<li><a href="/HF21/home.jsp"><img src="/HF21/image/menu1.png" alt="ホーム"></a></li>
			<li><a href="/HF21/discovery.html"><img src="/HF21/image/menu2.png" alt="検索"></a></li>
			<li><a href="/HF21/notice.html"><img src="/HF21/image/menu3.png" alt="通知"></a></li>
			<li><a href="/HF21/dm.html"><img src="/HF21/image/menu4.png" alt="dm"></a></li>
			<li><a href="/HF21/profile.html"><img src="/HF21/image/menu5.png" alt="プロフィール"></a></li>
		</ul>

	</body>
</html>
