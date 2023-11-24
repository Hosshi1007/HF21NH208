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


	//表示するwaveIDを取得
	String waveID = request.getParameter("waveID");

	//該当waveの情報だけを再取得？
	/* getwave_specific() 名前暫定 */

%>


<!DOCTYPE html>

<html lang="ja">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
  <link rel="stylesheet" href="/HF21/css/reset.css">
  <link rel="stylesheet" href="/HF21/css/format.css">
  <link rel="stylesheet" href="/HF21/css/home.css">
  <link rel="stylesheet" href="/HF21/css/scroll.css">
  <link rel="stylesheet" href="/HF21/css/wave.css">

  <title>Wave</title>

</head>

<body>

  <!-- 画像zoom画面 -->
  <div id = "zoomback">
    <img id = "zoomimg" src = "/HF21/image/usericon1.jpg">
  </div>

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


    </div>
  </header>

  <!--スマートフォン用メイン -->
  <main class="smart-main">

    <div class='tab-content main_contents_center'>

      <!--wave中身始まり -->
      <div class='main_contents'>
        <!-- userアイコン -->
        <div class="main_contents_image"><img class="main_contents_image" src="/HF21/image/usericon1.jpg" alt="usericon1"></div>
        <!-- user情報 -->
        <div class="user_info">
          <div class="main_contents_user_name">はるたろう from NH208</div>
          <div class="main_contents_userID">@haltarou
          </div>
        </div>
        <!-- waver認証情報 -->
        <div class="main_contents_certification">
          <img class="OP_certification" src="/HF21/image/OP-on.jpg">
        </div>
        <!-- waveの文字部分 -->
        <div class="main_contents_contents">
          先日、第9回はんだ山車まつりに行ってきました！<br>
          山車を引っ張る曳き方の掛け声や囃子方の笛の音色を聞きつつ<br>
          沢山の屋台やキッチンカーでおいしいものを食べては飲んでました！笑<br>
          山車は全部で31台！全部並ぶと結構迫力！<br>
          グッズも多数発売されていました～！<br>
          次回が待ち遠しいですね～。<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>
          スクロールテスト用<br>

        </div>
        <!-- waveの画像群 -->
        <div class="main_contents_contents_image">
          <div class="main_contents_contents_image_box1">
            <img src="/HF21/image/DSC_0137.JPG" alt="" class="zoom">
            <img src="/HF21/image/1.JPG" alt="" class="zoom">
          </div>

          <div class="main_contents_contents_image_box1">
            <img src="/HF21/image/2.JPG" alt="" class="zoom">
            <img src="/HF21/image/usericon1.jpg" alt="" class="zoom" style="display: none;">
          </div>

        </div>
        <!-- 投稿日時 -->
        <div class="main_contents_datetime">2023-11-07-18:56</div>

        <!-- wave付属情報 -->
        <div class="container-waveinfo">
          <div class="main_contents_waveinfo">
            <img class="blockchain-on" src="/HF21/image/chain-on.png">
            <div class="waveinfo_message">このWaveはwaveプロトコルで保護されています。</div>
          </div>

          <div class="main_contents_waveinfo">
            <img class="blockchain-on statusoff" src="/HF21/image/chain-on.png">
            <div class="waveinfo_message">このWaveはオリジンWaveではありません。</div>
          </div>

          <div class="main_contents_waveinfo wave_source">
            <img class="blockchain-on" src="/HF21/image/chain-on.png">
            <div class="waveinfo_message">このWaveにはソース記事(外部サイト)があります(クリックで表示)</div>
          </div>
        </div>


      </div>
      <!--wave中身終わり -->

    </div>



    <!--tool_tab始まり -->
    <div class="tool_tab">
      <img src="/HF21/image/plus.png" alt="">
      <img src="/HF21/image/plus.png" alt="">
      <img src="/HF21/image/plus.png" alt="">
      <img src="/HF21/image/plus.png" alt="">
      <img src="/HF21/image/plus.png" alt="">
    </div>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/HF21/js/tab.js"></script>
    <script type="text/javascript" src="/HF21/js/scroll.js"></script>
    <script type="text/javascript" src="/HF21/js/image-big.js"></script>

  </main>
  <!--スマートフォン用ボトムメニュー -->
  <ul class="bottom-menu" id="sita_scroll">
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