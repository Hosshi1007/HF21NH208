<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%
	String userID_temp = request.getParameter("userID");
%>

<html>

<head>
  	<link rel="stylesheet" href="/HF21/css/reset.css" />
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
  	<link rel="stylesheet" href="/HF21/css/login.css" />
  	<title>Wave</title>
</head>

<body class="smart-body">
  <main class="smart-main">
   <img class="logo" src="/HF21/image/logo.svg" alt="ロゴ" />
    <p class="sign" align="center">ログイン</p>
    <div class="errmsg">※ユーザーIDかパスワードが誤っています。</div>
    <form class="form1" method="post" action="/HF21/servlet/login">
      <input id="user" class="un " type="text" align="center" placeholder="ユーザーID" value="<%= userID_temp %>" name="userID" required>
      <input id="password" class="pass" type="password" align="center" placeholder="パスワード" name="password" required><br>
      <button type="submit" class="submit">ログイン</button>
      <p class="forgot"><a href="/HF21/signup.html">アカウント作成</a></p>
    </form>
    </main>
</body>

</html>