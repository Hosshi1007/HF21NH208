
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<%

			String myname = "自分";

			//文字コードの指定
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

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

			try{
		        // JDBCドライバーのロード
		        Class.forName(DRIVER);

		        // Connectionオブジェクト作成
		        con = DriverManager.getConnection(URL, USER, PASSWORD);

		        // PreparedStatementオブジェクト作成（選択クエリ）
		        String selectQuery = "SELECT * FROM dm WHERE name = ? OR follower = ? ";
		        pstmt = con.prepareStatement(selectQuery);
		        pstmt.setString(1, "自分");
		        pstmt.setString(2, "自分");

		        // SQL文の実行（選択クエリ）
		        rs = pstmt.executeQuery();

				//抽出データを繰り返し処理で表示する
				while(rs.next()){     //存在する
									//ヒットフラグオン
									hit_flag=1;

					//検索データをHashMapへ格納する
					map = new HashMap<String,String>();
					map.put("name",rs.getString("name"));
					map.put("time",rs.getString("time"));
					map.put("text",rs.getString("text"));
					map.put("follower",rs.getString("follower"));


					//一件分のデータ(HashMap)をArrayListへ追加
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
						<label for="cp_toggle04" ><img src="image/kudou.png" alt="menu-icon" class="hdrprfile"></label>
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
                for (int i = 0; i < list.size(); i++) {
                	if( myname.equals(list.get(i).get("name"))){
            %>

	            <a href="dm_talk.jsp?follower=<%=list.get(i).get("follower") %>">
				    <table class="dm_list">
				        <tr>
				        	<td>

								<div class="post">
									<div class="hsp12p"></div>
									<div class="xyz">
										<div class="picture"><img class="maru" src="image/megane.jpg" alt="picture"></div>

										<div class="y">
											<div class="z">
												<div class="username"><%=list.get(i).get("follower") %></div>
												<div class="userid">@Xxyutaka-maxX</div>
											</div>

											<div class="hsp3p"></div>

											<div class="maincontent"><%=list.get(i).get("text") %></div>
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
                }
              }
            %>







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