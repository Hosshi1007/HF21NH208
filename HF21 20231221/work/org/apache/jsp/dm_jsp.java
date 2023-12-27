/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.32
 * Generated at: 2023-12-21 09:37:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import com.example.AESEncryption;
import com.example.EncryptionUtil;

public final class dm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.example.EncryptionUtil");
    _jspx_imports_classes.add("com.example.AESEncryption");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
 response.setContentType("text/html; charset=UTF-8"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");



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


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ja\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width\">\r\n");
      out.write("    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>\r\n");
      out.write("    <title>Wave</title>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width\">\r\n");
      out.write("    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/reset.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/format.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/scroll.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/home.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/hamburger.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/dm.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <header class=\"smart-header\">\r\n");
      out.write("        <div id=\"scrollArea\">\r\n");
      out.write("            <div class=\"head\">\r\n");
      out.write("\t\t    \t<div class=\"cp_cont\">\r\n");
      out.write("\t\t\t\t\t<div class=\"cp_offcm04\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"checkbox\" id=\"cp_toggle04\" OnClick=\"btnCtr()\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"cp_toggle04\" ><img src=\"");
      out.print(usericon );
      out.write("\" alt=\"menu-icon\" class=\"hdrprfile\"></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"cp_menu\" class=\"hamburger-demo-switch hamburger-demo-switch1\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"hamburger-demo-cover\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("                <a href=\"#\">\r\n");
      out.write("                    <img class=\"logo\" src=\"/HF21/image/logo.svg\" alt=\"ロゴ\">\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class='tabs'>\r\n");
      out.write("                <div class='tab-buttons'>\r\n");
      out.write("                    <span class='content1' value=\"select1\" onclick=\"viewChange();\">メッセージリスト</span>\r\n");
      out.write("                    <span class='content2' value=\"select2\" onclick=\"viewChange();\">リクエスト</span>\r\n");
      out.write("                    <div id='lamp' class='content1'></div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </header>\r\n");
      out.write("    <main class=\"smart-main\">\r\n");
      out.write("\r\n");

    Set<String> displayedNames = new HashSet<>();
    for (int i = 0; i < list.size(); i++) {
        String currentName = list.get(i).get("name").toString();
        String currentFollower = list.get(i).get("follower").toString();

        if (session_user_name.equals(currentName) && !displayedNames.contains(currentFollower)) {

      out.write("\r\n");
      out.write("        <a href=\"dm_talk.jsp?follower=");
      out.print(currentFollower);
      out.write("\">\r\n");
      out.write("            <table class=\"dm_list\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <div class=\"post\">\r\n");
      out.write("                            <div class=\"hsp12p\"></div>\r\n");
      out.write("                            <div class=\"xyz\">\r\n");
      out.write("                                <div class=\"picture\"><img class=\"maru\" src=");
      out.print(list.get(i).get("user_img"));
      out.write(" alt=\"picture\"></div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"y\">\r\n");
      out.write("                                    <div class=\"z\">\r\n");
      out.write("                                        <div class=\"username\">");
      out.print(currentFollower);
      out.write("</div>\r\n");
      out.write("                                        <div class=\"userid\">");
      out.print(list.get(i).get("userID"));
      out.write("</div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"hsp3p\"></div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"maincontent\">");
      out.print(list.get(i).get("text"));
      out.write("</div>\r\n");
      out.write("                                    <div class=\"hsp3p\"></div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"hsp6p\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </a>\r\n");
      out.write("        <hr class=\"style-one\">\r\n");

            displayedNames.add(currentFollower);
        } else if (session_user_name.equals(currentFollower) && !displayedNames.contains(currentName)) {

      out.write("\r\n");
      out.write("        <a href=\"dm_talk.jsp?follower=");
      out.print(currentName);
      out.write("\">\r\n");
      out.write("            <table class=\"dm_list\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <div class=\"post\">\r\n");
      out.write("                            <div class=\"hsp12p\"></div>\r\n");
      out.write("                            <div class=\"xyz\">\r\n");
      out.write("                                <div class=\"picture\"><img class=\"maru\" src=");
      out.print(list.get(i).get("user_img"));
      out.write("  alt=\"picture\"></div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"y\">\r\n");
      out.write("                                    <div class=\"z\">\r\n");
      out.write("                                        <div class=\"username\">");
      out.print(currentName);
      out.write("</div>\r\n");
      out.write("                                        <div class=\"userid\">@Xxyutaka-maxX</div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"hsp3p\"></div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"maincontent\">");
      out.print(list.get(i).get("text"));
      out.write("</div>\r\n");
      out.write("                                    <div class=\"hsp3p\"></div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"hsp6p\"></div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </a>\r\n");
      out.write("        <hr class=\"style-one\">\r\n");

            displayedNames.add(currentName);
        }
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul class=\"bottom-menu\" id=\"bottom-menu\">\r\n");
      out.write("    <li>\r\n");
      out.write("        <a href=\"/HF21/home.jsp\">\r\n");
      out.write("        \t<img src=\"image/menu1.png\" alt=\"ホーム\">\r\n");
      out.write("\t\t</a>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li>\r\n");
      out.write("        <a href=\"/HF21/Discovery.html\">\r\n");
      out.write("        \t<img src=\"image/menu2.png\" alt=\"検索\">\r\n");
      out.write("\t\t</a>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li>\r\n");
      out.write("        <a href=\"/HF21/post.jsp\">\r\n");
      out.write("        \t<img src=\"image/plus.png\" alt=\"投稿\">\r\n");
      out.write("\t\t</a>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li>\r\n");
      out.write("        <a href=\"notice.html\">\r\n");
      out.write("        \t<img src=\"image/menu3.png\" alt=\"通知\">\r\n");
      out.write("\t\t</a>\r\n");
      out.write("    </li>\r\n");
      out.write("     <li>\r\n");
      out.write("         <a href=\"dm.jsp\">\r\n");
      out.write("             <img src=\"image/menu4.png\" alt=\"dm\">\r\n");
      out.write("         </a>\r\n");
      out.write("     </li>\r\n");
      out.write("</ul>\r\n");
      out.write("    </body>\r\n");
      out.write("    <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/HF21/js/tab.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/HF21/js/scroll.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/HF21/js/hamburger.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        function viewChange() {\r\n");
      out.write("            var selectedTab = document.querySelector('.tab-buttons .selected');\r\n");
      out.write("            var id = selectedTab.getAttribute('value');\r\n");
      out.write("\r\n");
      out.write("            if (id === 'select1') {\r\n");
      out.write("                document.getElementById('Box1').style.display = \"\";\r\n");
      out.write("                document.getElementById('Box2').style.display = \"none\";\r\n");
      out.write("            } else if (id === 'select2') {\r\n");
      out.write("                document.getElementById('Box1').style.display = \"none\";\r\n");
      out.write("                document.getElementById('Box2').style.display = \"\";\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        window.onload = function () {\r\n");
      out.write("            // 初期表示時に1つ目のタブを選択状態にする\r\n");
      out.write("            document.querySelector('.tab-buttons span[value=\"select1\"]').classList.add('selected');\r\n");
      out.write("            viewChange();\r\n");
      out.write("        };\r\n");
      out.write("    </script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}