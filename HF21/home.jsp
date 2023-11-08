<%@page import="com.sun.rowset.internal.Row"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//ログアウト検知
	String logout = request.getParameter("logout");
	if(logout != null){
		//セッション変数消去
		session.removeAttribute("session_userID");
		session.removeAttribute("session_user_name");
		session.removeAttribute("session_err");
	}

	//セッションデータ受け取り
	String session_userID = (String)session.getAttribute("session_userID");
	String session_user_name = (String)session.getAttribute("session_user_name");

	//セッション確認
	if(session_userID == null){
		request.setAttribute("session_err", "セッションエラー　Loginページへ遷移します。");
		response.sendRedirect("/HF21/login.html");
	}

	//wave検索



%>


<!DOCTYPE html>

<html lang="ja">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <link rel="stylesheet"  href="/HF21/css/reset.css">
    <link rel="stylesheet"  href="/HF21/css/format.css">
    <link rel="stylesheet"  href="/HF21/css/home.css">
    <link rel="stylesheet"  href="/HF21/css/scroll.css">

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

  <!--スマートフォン用メイン -->
  <main class="smart-main">

  <div class='tab-content'>

    <!--おすすめ -->
    <div class='content1'>
        <div class="post"><a href="/HF21/wave.jsp"><%= session_user_name %><%= session_userID %></a></div>
        <div class="post"><a href="wave.html">sample2</a></div>
        <div class="post"><a href="wave.html">sample3</a></div>
        <div class="post"><a href="wave.html">sample4</a></div>
        <div class="post"><a href="wave.html">sample5</a></div>
        <div class="post"><a href="wave.html">sample6</a></div>
        <div class="post"><a href="wave.html">sample7</a></div>
        <div class="post"><a href="wave.html">sample8</a></div>
        <div class="post"><a href="wave.html">sample9</a></div>
        <div class="post"><a href="wave.html">sample10</a></div>
    </div>
    <!--フォロー中 -->
    <div class='content2'>
        <div class="post"><a href="wave.html">sample1</a></div>
        <div class="post"><a href="wave.html">sample2</a></div>
        <div class="post"><a href="wave.html">sample3</a></div>
        <div class="post"><a href="wave.html">sample4</a></div>
        <div class="post"><a href="wave.html">sample5</a></div>
        <div class="post"><a href="wave.html">sample6</a></div>
        <div class="post"><a href="wave.html">sample7</a></div>
        <div class="post"><a href="wave.html">sample8</a></div>
        <div class="post"><a href="wave.html">sample9</a></div>
        <div class="post"><a href="wave.html">sample10</a></div>
    </div>
  </div>
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
        <a href="/HF21/dm.html">
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

