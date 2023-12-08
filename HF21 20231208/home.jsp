<%@page import="com.sun.rowset.internal.Row"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String result = "";


%>


<!DOCTYPE html>

<html lang="ja">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <link rel="stylesheet" type="text/css" href="/HF21/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/format.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/home.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/hamburger.css">

    <script type="text/javascript" src="/HF21/js/caltime.js"></script>

    <title>Wave Home</title>
  </head>

  <body>

	<!--- スマートフォン用タブ--->
	<header class="smart-header">
	    <div id="scrollArea">
	    <div class="head">
	  <a href="#">
	    <img class="logo" src="/HF21/image/logo.svg" alt="ロゴ">
	  </a>
	  <a href="post.html">
	    <img class="plus" src="/HF21/image/plus.png" alt="プラス">
	  </a>
	</div>

	<div class='tabs'>
	  <div class='tab-buttons'>
	    <span class='content1'>おすすめ</span>
	    <span class='content2'>フォロー中</span>
	    <div id='lamp' class='content1'></div>
	  </div>
	  </div>
	</div>
	</header>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="/HF21/js/tab.js"></script>
  <script type="text/javascript" src="/HF21/js/scroll.js"></script>

  </main>
<!--スマートフォン用ボトムメニュー -->
<ul class="bottom-menu">
    <li>
        <a href="/HF21/home.jsp">
        <img src="/HF21/image/menu1.png" alt="ホーム"></a>
    </li>
    <li>
        <a href="/HF21/search.html">
        <img src="/HF21/image/menu2.png" alt="検索"></a>
    </li>
    <li>
        <a href="/HF21/notice.html">
        <img src="/HF21/image/menu3.png" alt="通知"></a>
    </li>
    <li>
        <a href="/HF21/dm.jsp">
        <img src="/HF21/image/menu4.png" alt="dm"></a>
    </li>
    <li>
        <a href="/HF21/profile.html">
        <!-- プロフィール画像がなしの場合menu5.png -->
        <img src="/HF21/image/menu5.png" alt="プロフィール"></a>
    </li>
</ul>


  </body>



</html>
