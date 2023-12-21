<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.example.AESEncryption"%>
<%@ page import="com.example.EncryptionUtil"%>
<%
    // 文字コードの指定
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





    // クエリパラメータからnameを取得
    String follower = (String) request.getAttribute("follower");
    String name = "";
    String text = "";
    String time = "";
    String before_text = "";

    System.out.println("jsp2: " + follower);

    // データベースに接続するために使用する変数設定
    Connection con = null;
    PreparedStatement pstmt = null;
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
        // JDBCドライバーのロード
        Class.forName(DRIVER);

        // Connectionオブジェクト作成
        con = DriverManager.getConnection(URL, USER, PASSWORD);

        // PreparedStatementオブジェクト作成（選択クエリ）
        String selectQuery = "SELECT * FROM dm inner join t_user on follower = user_name WHERE name = ? AND follower = ? OR name = ? AND follower = ? ORDER BY time ASC";
        pstmt = con.prepareStatement(selectQuery);
        pstmt.setString(1, follower);
        pstmt.setString(2, session_user_name);
        pstmt.setString(3, session_user_name);
        pstmt.setString(4, follower);

        // SQL文の実行（選択クエリ）
        rs = pstmt.executeQuery();

        // ハッシュ化された文字列を元に戻す処理
        while (rs.next()) {
            // レコードが存在する場合
            // ヒットフラグオン
            hit_flag = 1;

            // 検索データをHashMapへ格納する
            map = new HashMap<>();
            map.put("name", rs.getString("name"));
            map.put("time", rs.getString("time"));

            // 復号化されたテキストから必要な部分を抽出
            String decryptedText = new EncryptionUtil().decryptTextFromDatabase(rs.getString("text"));
            text = new EncryptionUtil().getAfterCommaPart(decryptedText);
            map.put("text", text);


            map.put("follower", rs.getString("follower"));
            map.put("user_img", rs.getString("user_img"));

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
            if (pstmt != null) pstmt.close();
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
                String timestr = time.substring(11, 16);

                if (sender.equals(session_user_name)) {
            %>
            <div class="message right">
            	<table class= "flex_r">
            		<tr>
            			<td id="time"><span class="timespan_r"><%=timestr %></span></td>
            			<td id="msg"><p class="lp"><%=text %></p></td>
            			<td id="icon"><div class="picture"><img id="imgicon" src="<%=list.get(0).get("user_img")%>" alt="menu-icon" class="hdrprfile"></div></td>
            		</tr>
                </table>
            </div>
            <%
                } else {
            %>
            <div class="message left">
            	<table class= "flex_l">
            		<tr>
            			<td id="icon"><div class="picture"><img id="imgicon" class="maru" src="<%=usericon %>"  alt="picture"></div></td>
            			<td id="msg"><p class="lp"><%=text %></p></td>
            			<td id="time"><span class="timespan_l"><%=timestr %></span></td>
            		</tr>
                </table>
            </div>
            <%
                }
            }
            %>
        </div>
        <form method="post" action="/HF21/servlet/dm_talk">
            <div class="input-box">
                <input type="text" id="text" name="text" placeholder="メッセージ...">
                <input type="hidden" id="before_text" name="before_text" value="<%=list.get(list.size() - 1).get("text")%>" >
                <input type="hidden" id="follower" name="follower" value=<%=follower %>>
                <input type="hidden" id="name" name="name" value=<%=session_user_name %>>
                <button onclick="sendMessage()">送信</button>
            </div>
        </form>
    </div>

	<ul class="bottom-menu" id="bottom-menu">
	    <li>
	        <a href="/HF21/home.jsp">
	        	<img src="../image/menu1.png" alt="ホーム">
			</a>
	    </li>
	    <li>
	        <a href="/HF21/Discovery.html">
	        	<img src="../image/menu2.png" alt="検索">
			</a>
	    </li>
	    <li>
	        <a href="/HF21/post.jsp">
	        	<img src="../image/plus.png" alt="投稿">
			</a>
	    </li>
	    <li>
	        <a href="notice.html">
	        	<img src="../image/menu3.png" alt="通知">
			</a>
	    </li>
	     <li>
	         <a href="/HF21/dm.jsp">
	             <img src="../image/menu4.png" alt="dm">
	         </a>
	     </li>
	</ul>

</body>


</html>