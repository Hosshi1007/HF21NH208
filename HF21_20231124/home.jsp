<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="wave.Caltime"%>
<%@page import="wave.Get_allwave"%>
<%@page import="wave.Get_userinfo"%>
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
		session.removeAttribute("session_err");
	}

	//セッションデータ受け取り
	String session_userID = (String)session.getAttribute("session_userID");
	String session_user_name = (String)session.getAttribute("session_user_name");

	//セッション確認
	if(session_userID == null){
		System.out.println(session_userID + "aa");
		response.sendRedirect("/HF21/login.html");
	}else{
		System.out.println(session_userID + "bb");
	}

  //userinfo取得
  Get_userinfo get_userinfo = new Get_userinfo();
  ArrayList usertbl = get_userinfo.get_userinfo_oneuser(session_userID);
  ArrayList userrow = (ArrayList)usertbl.get(0);

  //wave取得
  Get_allwave newwave = new Get_allwave();
  ArrayList wavetbl = newwave.get_allwave_oneuser(session_userID);
  ArrayList waverow = new ArrayList();

	//timesago計算用クラス呼び出し
	Caltime cal = new Caltime();
	String result = "";


%>


<!DOCTYPE html>

<html lang="ja">

  <head>
	<!-- bean紐づけ -->
  	<%-- <jsp:useBean id="get_userinfo" scope="request" class="wave.wave_select_Beans" /> --%>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <link rel="stylesheet" type="text/css" href="/HF21/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/format.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/home.css">
    <script type="text/javascript" src="/HF21/js/tab.js"></script>
    <script type="text/javascript" src="/HF21/js/scroll.js"></script>
    <script type="text/javascript" src="/HF21/js/redirecttowave.js"></script>

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
	  <a href="/HF21/post.jsp">
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

    <div class='content1'>
		<% for(int i=0; i<wavetbl.size(); i++){
			waverow = (ArrayList)wavetbl.get(i);
    %>
			<% result = cal.caltime((String)waverow.get(7));%>
            <div class="post">
                <div class="hsp12p"></div>
                <div class="xyz">
                    <div class="picture"><img class="maru" src="<%= (String)userrow.get(2) %>" alt="picture"></div>

                    <div class="y" onclick="redirectToWave(<%= (String)waverow.get(0) %>)">
                        <div class="z">
                            <div class="username"><%= (String)userrow.get(1) %></div>
                            <div class="userid">@<%= (String)userrow.get(0) %></div>
                            <div class="timesago">･<%= result %></div>
                        </div>

                        <div class="hsp3p"></div>

                        <div class="maincontent"><%= (String)waverow.get(2) %></div>
                        <div class="hsp3p"></div>
                        <div class="hasamu">
                            <div class="icons">💭</div>
                            <div class="icons">♡</div>
                            <div class="icons">◯</div>
                            <div class="icons">□</div>
                            <div class="icons">…</div>
                        </div>
                    </div>
                </div>
                <div class="hsp6p"></div>
            </div>
          <% } %>
          </div>


    <!--フォロー中 -->
    <div class='content2'>
		<% for(int i=0; i<wavetbl.size(); i++){
			waverow = (ArrayList)wavetbl.get(i);
    %>
			<% result = cal.caltime((String)waverow.get(7));%>
            <div class="post">
                <div class="hsp12p"></div>
                <div class="xyz">
                    <div class="picture"><img class="maru" src="<%= (String)userrow.get(2) %>" alt="picture"></div>

                    <div class="y" onclick="redirectToWave(<%= (String)waverow.get(0) %>)">
                        <div class="z">
                            <div class="username"><%= (String)userrow.get(1) %></div>
                            <div class="userid">@<%= (String)userrow.get(0) %></div>
                            <div class="timesago">･<%= result %></div>
                        </div>

                        <div class="hsp3p"></div>

                        <div class="maincontent"><%= (String)waverow.get(2) %></div>
                        <div class="hsp3p"></div>
                        <div class="hasamu">
                            <div class="icons">💭</div>
                            <div class="icons">♡</div>
                            <div class="icons">◯</div>
                            <div class="icons">□</div>
                            <div class="icons">…</div>
                        </div>
                    </div>
                  </div>
                <div class="hsp6p"></div>
            </div>
          <% } %>
  </div>
  </div>

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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="/HF21/js/tab.js"></script>
  <script type="text/javascript" src="/HF21/js/scroll.js"></script>
  <script type="text/javascript" src="/HF21/js/redirecttowave.js"></script>

  </body>



</html>

