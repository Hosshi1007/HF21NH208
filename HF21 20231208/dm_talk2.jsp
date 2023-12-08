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

    // クエリパラメータからnameを取得
    String follower = (String) request.getAttribute("follower");
    String name = "";
    String text = "";
    String time = "";

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
        String selectQuery = "SELECT * FROM dm WHERE name = ? AND follower = ? OR name = ? AND follower = ?";
        pstmt = con.prepareStatement(selectQuery);
        pstmt.setString(1, follower);
        pstmt.setString(2, "自分");
        pstmt.setString(3, "自分");
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
            map.put("text", new EncryptionUtil().decryptTextFromDatabase(rs.getString("text")));
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
                String timestr = time.substring(11, 16);

                if (sender.equals("自分")) {
            %>
            <div class="message right">
            	<table class= "flex_r">
            		<tr>
            			<td id="time"><span class="timespan_r"><%=timestr %></span></td>
            			<td id="msg"><p><%=text %></p></td>
            			<td id="icon"><div class="picture"><img id="icon" src="../image/kudou.png" alt="menu-icon" class="hdrprfile"></div></td>
            		</tr>
                </table>
            </div>
            <%
                } else {
            %>
            <div class="message left">
            	<table class= "flex_l">
            		<tr>
            			<td id="icon"><div class="picture"><img id="icon" class="maru" src="../image/megane.jpg" alt="picture"></div></td>
            			<td id="msg"><p><%=text %></p></td>
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
                <input type="text" id="text" name="text"  placeholder="メッセージ...">
                <input type="hidden" id="follower" name="follower" value=<%=follower %>>
                <button onclick="sendMessage()">送信</button>
            </div>
        </form>
    </div>

    <ul class="bottom-menu">
        <li>
            <a href="../home.jsp">
                <img src="../image/menu1.png" alt="ホーム">
            </a>
        </li>
        <li>
            <a href="../search.html">
                <img src="../image/menu2.png" alt="検索">
            </a>
        </li>
        <li>
            <a href="../notice.html">
                <img src="../image/menu3.png" alt="通知">
            </a>
        </li>
        <li>
            <a href="../dm.jsp">
                <img src="../image/menu4.png" alt="dm">
            </a>
        </li>
        <li>
            <a href="../profile.html">
                <img src="../image/menu5.png" alt="プロフィール">
            </a>
        </li>
    </ul>

</body>

<script>

function sendMessage() {
    var messageInput = document.getElementById("text");
    var messageText = messageInput.value.trim();
    if (messageText !== "") {
        var currentTime = new Date();
        var formattedTime = currentTime.getHours() + ":" + padZero(currentTime.getMinutes());

        // Append the new message to the chat box
        appendMessage("自分", messageText, formattedTime);

        // Scroll the chat box to the top
        scrollChatToTop();

        // Clear the input field
        messageInput.value = "";
    }
}

function appendMessage(sender, text, time) {
    var chatBox = document.getElementById("chatBox");
    var messageContainer = document.createElement("div");
    messageContainer.className = "message";

    if (sender === "自分") {
        messageContainer.classList.add("right");
    } else {
        messageContainer.classList.add("left");
    }

    var timeElement = document.createElement("span");
    timeElement.className = "time";
    timeElement.textContent = time;

    var message = document.createElement("p");
    message.textContent = text + ": " + sender;

    messageContainer.appendChild(timeElement);
    messageContainer.appendChild(message);
    chatBox.appendChild(messageContainer);
}

function scrollChatToTop() {
    var chatBox = document.getElementById("chatBox");
    chatBox.scrollTop = chatBox.scrollHeight;
}

function padZero(number) {
    return (number < 10 ? "0" : "") + number;
}
</script>

</html>