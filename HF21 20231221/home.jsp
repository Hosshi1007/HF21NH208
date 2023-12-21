<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="wave.Get_allwave"%>
<%@page import="com.sun.rowset.internal.Row"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>


<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//ログアウト検知
	String logout = request.getParameter("logout");
	if(logout != null){
		//セッション変数消去
		session.removeAttribute("session_userID");
		session.removeAttribute("session_user_name");
		session.removeAttribute("session_usericon");
		session.removeAttribute("session_err");
	}

	//セッションデータ受け取り
	String session_userID = (String)session.getAttribute("session_userID");
	String session_user_name = (String)session.getAttribute("session_user_name");
	String usericon = (String)session.getAttribute("session_usericon");

	//セッション確認
	if(session_userID == null){
		System.out.println(session_userID + "aa");
		response.sendRedirect("/HF21/login.html");
	}else{
		System.out.println(session_userID + "aa");
		System.out.println(session_user_name + "bb");
		System.out.println(usericon + "cc");
	}

	//userinfo取得
	//Get_userinfo get_userinfo = new Get_userinfo();
	//ArrayList usertbl = get_userinfo.get_userinfo_oneuser(session_userID);
	//ArrayList userrow = (ArrayList)usertbl.get(0);

  	//wave取得
  	Get_allwave newwave = new Get_allwave();
  	//ArrayList wavetbl = newwave.get_allwave_oneuser(session_userID);

  	//json作成メソッド発動
  	newwave.get_wave_manyuser();

	//timesago計算用クラス呼び出し
	//Caltime cal = new Caltime();
	String result = "";


%>


<!DOCTYPE html>

<html lang="ja">

  <head>
	<style>
        .loading{
            display:flex;
            justify-content: center;
        }
        .loading:before {
            content: '読み込み中 ...';
        }
	</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, 	viewport-fit=cover'>

    <title>Wave home</title>

    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/format.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/scroll.css">
    <link rel="stylesheet" type="text/css" href="css/hamburger.css">
  </head>
<!--- スマートフォン用タブ-->
	<header class="smart-header">
    <div id="scrollArea">
    <div class="head">
    	<div class="cp_cont">
			<div class="cp_offcm04">
				<input type="checkbox" id="cp_toggle04" OnClick="btnCtr()">
				<label for="cp_toggle04" ><img src="<%=usericon %>" alt="menu-icon" class="hdrprfile"></label>
				<div class="cp_menu" class="hamburger-demo-switch hamburger-demo-switch1">
					<ul class="hammenu">
						<div class="hsp12p"></div>
							<div class="picture"><img class="maru" src="<%=usericon %>" alt="picture"></div>
							<div class="createacc">新しいアカウントを作成</div>
							<div class="hsp12p"></div>
							<div class="username"><%=session_user_name %></div>
							<div class="userid">@<%=session_userID %></div>
							<div class="hsp36p"></div>
							<div class="sepline1"></div>
							<div class="menus">プロフィール</div>
							<div class="menus">3フォロー</div>
							<div class="menus">3フォロワー</div>
							<div class="menus">お気に入り</div>
							<div class="sepline2"></div>
							<div class="menus">設定</div>
							<div class="menus">テーマの設定</div>
							<div class="lastmenus">
								<div id="logout">ログアウト</div>
								<div id="switch">アカウントを切替</div>
							</div>
						<div class="hsp6p"></div>
					</ul>
				</div>
				<div class="hamburger-demo-cover"></div>
			</div>
		</div>
		<a href="#">
		    <img class="logo" src="image/logo.svg" alt="ロゴ">
		 </a>
		</div>

		<div class='tabs'>
		  <div class='tab-buttons'>
		    <span class='content1' id="contents1">おすすめ</span>
		    <span class='content2' id="contents2">フォロー中</span>
		    <div id='lamp' class='content1'></div>
		  </div>
		  </div>
		</div>
	</header>

  <body>

  <!--スマートフォン用メイン -->
  <main class="smart-main" id="smart-main">

  <div class='tab-content'>
    <!--おすすめ -->
    <div id='content1'>

    </div>

    <div id='content2'>
		<div   id="post">
			<div class="hsp12p"></div>
			<div class="xyz">
				<div class="picture"><img class="maru" src="image/susuru.jpg" alt="picture"></div>
				<div class="y">
					<div class="z">
						<div class="username">鉄火巻＠委員長</div>
						<div class="userid">@TekkaMaki_0141</div>
						<div class="timesago">·4時間</div>
					</div>

					<div class="hsp3p"></div>

					<div class="maincontent">
						こちらが 濃厚とんこつ豚無双さんの<br>
						濃厚無双ラーメン 海苔トッピングです<br>
						うっひょ～～～～～～！<br>
						着席時 コップに水垢が付いていたのを見て<br>
						大きな声を出したら 店主さんからの誠意で<br>
						チャーシューをサービスしてもらいました<br>
						俺の動画次第でこの店潰す事だってできるんだぞって事で<br>
						いただきま～～～～す！まずはスープから<br>
						コラ～！<br>
						これでもかって位ドロドロの濃厚スープの中には<br>
						虫が入っており 怒りのあまり<br>
						卓上調味料を全部倒してしまいました～！<br>
						すっかり店側も立場を弁え 誠意のチャーシュー丼を貰った所で<br>
						お次に 圧倒的存在感の極太麺を<br>
						啜る～！ 殺すぞ～！<br>
						ワシワシとした食感の麺の中には、髪の毛が入っており<br>
						さすがのSUSURUも 厨房に入って行ってしまいました～！<br>
						ちなみに、店主さんが土下座している様子は ぜひサブチャンネルをご覧ください
					</div>
					<div class="hsp3p"></div>
					<div class="hasamu"><div class="icons">💭</div><div class="icons">♡</div><div class="icons">◯</div><div class="icons">□</div><div class="icons">…</div></div>
				</div>
			</div>
			<div class="hsp6p"></div>
		</div>
	</div>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/tab.js"></script>
  <script type="text/javascript" src="js/scroll.js"></script>
  <script type="text/javascript" src="js/hamburger.js"></script>
  <script type="text/javascript" src="js/fetch.js"></script>
  <script type="text/javascript" src="js/infinite.js"></script>

  </main>
    <!--スマートフォン用ボトムメニュー -->
<ul class="bottom-menu" id="bottom-menu">
    <li>
        <a href="/HF21/home.jsp" >

        	<img src="image/menu1.png" alt="ホーム">
		</a>
    </li>
    <li>
        <a href="/HF21/Discovery.html">
        	<img src="image/menu2.png" alt="検索">
		</a>
    </li>
    <li>
        <a href="/HF21/post.jsp">
        	<img src="image/plus.png" alt="投稿">
		</a>
    </li>
    <li>
        <a href="notice.html">
        	<img src="image/menu3.png" alt="通知">
		</a>
    </li>
     <li>
         <a href="dm.jsp">
             <img src="image/menu4.png" alt="dm">
         </a>
     </li>
</ul>


  </body>



</html>