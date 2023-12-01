<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
    // 文字コードの指定
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // クエリパラメータからfollowerを取得
    String follower = request.getParameter("follower");
    String name, text, time;

    System.out.println("jsp: " + follower);

    // データベースに接続するために使用する変数設定
    Connection con = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;

    // ローカルMySQLに接続する設定
    String USER = "root";
    String PASSWORD = "";
    String URL = "jdbc:mysql://localhost/hf21";
    String DRIVER = "com.mysql.jdbc.Driver";

    // 確認メッセージ
    StringBuffer ERMSG = null;

    // ヒットフラグ
    int hit_flag = 0;

    // HashMap(一件分のデータを格納する連想配列)
    HashMap<String, String> map = null;

    // ArrayList(全ての件数を格納する配列)
    ArrayList<HashMap<String, String>> list = new ArrayList<>();

    try {
        // MySQLDriverローディング
        Class.forName(DRIVER);
        // MySQLへの接続
        con = DriverManager.getConnection(URL, USER, PASSWORD);
        // SQL格納
        stmt = con.createStatement();
        // StringBuffer用意
        StringBuffer query = new StringBuffer();

        query = new StringBuffer();
        query.append("SELECT * FROM dm WHERE name ='自分'and follower ='");
        query.append(follower);
        query.append("'");
        query.append(" OR name = '");
        query.append(follower);
        query.append("' AND follower = '自分'");
        System.out.println(query.toString());
        rs = stmt.executeQuery(query.toString());

        // 抽出データを繰り返し処理で表示する
        while (rs.next()) {
            // レコードが存在する場合
            // ヒットフラグオン
            hit_flag = 1;

            // 検索データをHashMapへ格納する
            map = new HashMap<>();
            map.put("name", rs.getString("name"));
            map.put("time", rs.getString("time"));
            map.put("text", rs.getString("text"));
            map.put("follower", rs.getString("follower"));

            // 一件分のデータ(HashMap)をArrayListへ追加
            list.add(map);
        }
    } catch (ClassNotFoundException | SQLException e) {
        ERMSG = new StringBuffer();
        ERMSG.append(e.getMessage());
    } finally {
        // リソースのクローズ
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            ERMSG = new StringBuffer();
            ERMSG.append(e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Wave</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <link rel="stylesheet" type="text/css" href="/HF21/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/format.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/home.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/dm_talk.css">
</head>

<body>
    <div id="scrollArea">
        <div class="head">
            <a href="#">
                <img class="logo" src="/HF21/image/logo.svg" alt="ロゴ">
            </a>
        </div>
    </div>

    <div class="container">
        <div class="chat-box" id="chatBox">
            <%
                for (HashMap<String, String> message : list) {
                    String sender = message.get("name");
                    text = message.get("text");
                    time = message.get("time");
                    String timestr =time.substring(11,16);

                    if (sender.equals("自分")) {
            %>
            <div class="message right">
            	<div class= "flex">
                	<span class="time"><%=timestr %></span><p><%=text %>:<%=sender %> </p>
                </div>
            </div>
            <%
                } else {
            %>
            <div class="message left">
            	<div class= "flex">
	                <div class="picture"><img class="maru" src="image/megane.jpg" alt="picture"></div>
	                <p><%=text %></p>
	                <span class="time"><%=timestr %></span>
                </div>
            </div>
            <%
                }
            }
            %>
        </div>
        <form method="post" action="/HF21/servlet/dm_talk">
            <div class="input-box">
                <input type="text" id="text" name="text" placeholder="メッセージ...">
                <input type="hidden" id="follower" name="follower" value=<%=follower %>>
                <button onclick="sendMessage()">送信</button>
            </div>
        </form>
    </div>

    <ul class="bottom-menu">
        <li>
            <a href="home.jsp">
                <img src="image/menu1.png" alt="ホーム">
            </a>
        </li>
        <li>
            <a href="search.html">
                <img src="image/menu2.png" alt="検索">
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
        <li>
            <a href="profile.html">
                <img src="image/menu5.png" alt="プロフィール">
            </a>
        </li>
    </ul>

</body>

</html>