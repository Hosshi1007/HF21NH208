
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="com.example.AESEncryption"%>
<%@ page import="com.example.EncryptionUtil"%>

<%


			//文字コードの指定
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




			//データベースに接続するために使用する変数設定
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
			Statement stmt = null;
			StringBuffer SQL = null;

			//ローカルMySQLに接続する設定
			String USER ="root";
			String PASSWORD  ="";
			String URL ="jdbc:mysql://localhost/hf21";

			String DRIVER = "com.mysql.jdbc.Driver";

			//確認メッセージ
			StringBuffer ERMSG = null;

			//ヒットフラグ
			int hit_flag = 0;

			//HashMap(一件分のデータを格納する連想配列)
			HashMap<String,String>map = null;

			//ArrayList(全ての件数を格納する配列)
			ArrayList<HashMap>list = null;
			list = new ArrayList<HashMap>();


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
		        query.append(" SELECT * FROM dm inner join t_user on follower = user_name WHERE name ='");
				query.append(session_user_name);
		        query.append("'OR follower ='");
				query.append(session_user_name);
		        query.append("'ORDER BY time DESC");
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

		            // 復号化されたテキストから必要な部分を抽出
		            String decryptedText = new EncryptionUtil().decryptTextFromDatabase(rs.getString("text"));
		            String text = new EncryptionUtil().getAfterCommaPart(decryptedText);
		            map.put("text", text);
		            map.put("user_img", rs.getString("user_img"));

		            map.put("follower", rs.getString("follower"));
		            map.put("userID", rs.getString("userID"));

		            // 一件分のデータ(HashMap)をArrayListへ追加
		            list.add(map);
		        }


			}				//tryブロック終了

			catch(ClassNotFoundException e){
				ERMSG = new StringBuffer();
				ERMSG.append(e.getMessage());
			}

			catch(SQLException e){
				ERMSG = new StringBuffer();
				ERMSG.append(e.getMessage());
			}

			catch(Exception e){
				ERMSG = new StringBuffer();
				ERMSG.append(e.getMessage());
			}



            for (int i = 0; i < list.size(); i++) {

		        System.out.println(list.get(i).get("name"));
            }

%>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <title>Wave</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>
    <link rel="stylesheet" type="text/css" href="/HF21/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/format.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/home.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/hamburger.css">
    <link rel="stylesheet" type="text/css" href="/HF21/css/dm.css">
</head>
<body>
    <header class="smart-header">
        <div id="scrollArea">
            <div class="head">
		    	<div class="cp_cont">
					<div class="cp_offcm04">
						<input type="checkbox" id="cp_toggle04" OnClick="btnCtr()">
						<label for="cp_toggle04" ><img src="<%=usericon %>" alt="menu-icon" class="hdrprfile"></label>
						<div class="cp_menu" class="hamburger-demo-switch hamburger-demo-switch1">
							<ul>

							</ul>
						</div>
						<div class="hamburger-demo-cover"></div>
					</div>
				</div>
                <a href="#">
                    <img class="logo" src="/HF21/image/logo.svg" alt="ロゴ">
                </a>
            </div>
            <div class='tabs'>
                <div class='tab-buttons'>
                    <span class='content1' value="select1" onclick="viewChange();">メッセージリスト</span>
                    <span class='content2' value="select2" onclick="viewChange();">リクエスト</span>
                    <div id='lamp' class='content1'></div>
                </div>
            </div>
        </div>
    </header>
    <main class="smart-main">

<%
    Set<String> displayedNames = new HashSet<>();
    for (int i = 0; i < list.size(); i++) {
        String currentName = list.get(i).get("name").toString();
        String currentFollower = list.get(i).get("follower").toString();

        if (session_user_name.equals(currentName) && !displayedNames.contains(currentFollower)) {
%>
        <a href="dm_talk.jsp?follower=<%=currentFollower%>">
            <table class="dm_list">
                <tr>
                    <td>
                        <div class="post">
                            <div class="hsp12p"></div>
                            <div class="xyz">
                                <div class="picture"><img class="maru" src=<%=list.get(i).get("user_img")%> alt="picture"></div>

                                <div class="y">
                                    <div class="z">
                                        <div class="username"><%=currentFollower%></div>
                                        <div class="userid"><%=list.get(i).get("userID")%></div>
                                    </div>

                                    <div class="hsp3p"></div>

                                    <div class="maincontent"><%=list.get(i).get("text")%></div>
                                    <div class="hsp3p"></div>
                                </div>
                            </div>
                            <div class="hsp6p"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </a>
        <hr class="style-one">
<%
            displayedNames.add(currentFollower);
        } else if (session_user_name.equals(currentFollower) && !displayedNames.contains(currentName)) {
%>
        <a href="dm_talk.jsp?follower=<%=currentName%>">
            <table class="dm_list">
                <tr>
                    <td>
                        <div class="post">
                            <div class="hsp12p"></div>
                            <div class="xyz">
                                <div class="picture"><img class="maru" src=<%=list.get(i).get("user_img")%>  alt="picture"></div>

                                <div class="y">
                                    <div class="z">
                                        <div class="username"><%=currentName%></div>
                                        <div class="userid">@Xxyutaka-maxX</div>
                                    </div>

                                    <div class="hsp3p"></div>

                                    <div class="maincontent"><%=list.get(i).get("text")%></div>
                                    <div class="hsp3p"></div>
                                </div>
                            </div>
                            <div class="hsp6p"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </a>
        <hr class="style-one">
<%
            displayedNames.add(currentName);
        }
    }
%>


<ul class="bottom-menu" id="bottom-menu">
    <li>
        <a href="/HF21/home.jsp">
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/HF21/js/tab.js"></script>
    <script type="text/javascript" src="/HF21/js/scroll.js"></script>
    <script type="text/javascript" src="/HF21/js/hamburger.js"></script>
    <script type="text/javascript">
        function viewChange() {
            var selectedTab = document.querySelector('.tab-buttons .selected');
            var id = selectedTab.getAttribute('value');

            if (id === 'select1') {
                document.getElementById('Box1').style.display = "";
                document.getElementById('Box2').style.display = "none";
            } else if (id === 'select2') {
                document.getElementById('Box1').style.display = "none";
                document.getElementById('Box2').style.display = "";
            }
        }

        window.onload = function () {
            // 初期表示時に1つ目のタブを選択状態にする
            document.querySelector('.tab-buttons span[value="select1"]').classList.add('selected');
            viewChange();
        };
    </script>
</html>