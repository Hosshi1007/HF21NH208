<%@page import="com.sun.rowset.internal.Row"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@page import="wave.Caltime"%>


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

	//timesago計算用クラス呼び出し
	Caltime cal = new Caltime();
	String result = "";

%>

<!DOCTYPE html>

<html lang="ja">

<head>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width">
  <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>

  <title>Wave</title>

  <link rel="stylesheet" type="text/css" href="/HF21/css/reset.css">
  <link rel="stylesheet" type="text/css" href="/HF21/css/format.css">
  <link rel="stylesheet" type="text/css" href="/HF21/css/post.css">
  <script type="text/javascript" src="/HF21/js/imgdisplay.js"></script>

</head>

<body>

  <!--- スマートフォン用タブ--->
  <header class="smart-header">
    <div class="head">
      <!--どっちもfinish();みたいな表示が希望！ -->
      <a class="cancel" onclick="history.back();">
        キャンセル
      </a>
      <button type="submit" class="post" form="post">
        投稿する
      </button>
    </div>
  </header>

  <!--スマートフォン用メイン -->
  <main class="smart-main">
    <form method="post" action="/HF21/servlet/ImageUploadServlet" enctype="multipart/form-data" id="post">
      <textarea name="wave_text" class="wave" placeholder="your wave goes here"></textarea>
      <div class="tr">
        <label for="logo">画像:</label>
        <div class="td">
          <input type="file" id="logo" name="logo" multiple onchange="displayImages(event)">
        </div>     
      </div>
    </form>

    <div id="imageContainer" style="display: none;">
      <!-- 4つのimg要素を用意 -->
      <img id="selectedImage1" src="#" alt="選択された画像1" style="display: none;">
      <img id="selectedImage2" src="#" alt="選択された画像2" style="display: none;">
      <img id="selectedImage3" src="#" alt="選択された画像3" style="display: none;">
      <img id="selectedImage4" src="#" alt="選択された画像4" style="display: none;">
    </div>


  </main>


  <!--スマートフォン用ボトムメニュー -->
  <ul class="bottom-menu">
    <li>
      <a href="/HF21/home.html">
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