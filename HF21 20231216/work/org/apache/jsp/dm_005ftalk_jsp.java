/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.32
 * Generated at: 2023-12-11 04:49:08 UTC
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
import java.text.SimpleDateFormat;
import java.util.Date;
import com.example.AESEncryption;
import com.example.EncryptionUtil;

public final class dm_005ftalk_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
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

      out.write('\r');
      out.write('\n');
 response.setContentType("text/html; charset=UTF-8"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            ERMSG = new StringBuffer();
            ERMSG.append(e.getMessage());
        }
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <title>Wave</title>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width\">\r\n");
      out.write("    <meta name='viewport' content='initial-scale=1, viewport-fit=cover'>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/reset.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/format.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/scroll.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/home.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/HF21/css/dm_talk.css\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    <div id=\"scrollArea\">\r\n");
      out.write("        <div class=\"head\">\r\n");
      out.write("            <a href=\"#\">\r\n");
      out.write("                <img class=\"logo\" src=\"/HF21/image/logo.svg\" alt=\"ロゴ\">\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"chat-box\" id=\"chatBox\">\r\n");
      out.write("            ");

                for (HashMap<String, String> message : list) {
                    String sender = message.get("name");
                    text = message.get("text");
                    time = message.get("time");
                    String timestr =time.substring(11,16);

                    if (sender.equals("自分")) {
            
      out.write("\r\n");
      out.write("            <div class=\"message right\">\r\n");
      out.write("            \t<table class= \"flex_r\">\r\n");
      out.write("            \t\t<tr>\r\n");
      out.write("            \t\t\t<td id=\"time\"><span class=\"timespan_r\">");
      out.print(timestr );
      out.write("</span></td>\r\n");
      out.write("            \t\t\t<td id=\"msg\"><p class=\"lp\">");
      out.print(text );
      out.write("</p></td>\r\n");
      out.write("            \t\t\t<td id=\"icon\"><div class=\"picture\"><img id=\"imgicon\" src=\"image/kudou.png\" alt=\"menu-icon\" class=\"hdrprfile\"></div></td>\r\n");
      out.write("            \t\t</tr>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                } else {
            
      out.write("\r\n");
      out.write("            <div class=\"message left\">\r\n");
      out.write("            \t<table class= \"flex_l\">\r\n");
      out.write("            \t\t<tr>\r\n");
      out.write("            \t\t\t<td id=\"icon\"><div class=\"picture\"><img id=\"imgicon\" class=\"maru\" src=\"image/megane.jpg\" alt=\"picture\"></div></td>\r\n");
      out.write("            \t\t\t<td id=\"msg\"><p class=\"lp\">");
      out.print(text );
      out.write("</p></td>\r\n");
      out.write("            \t\t\t<td id=\"time\"><span class=\"timespan_l\">");
      out.print(timestr );
      out.write("</span></td>\r\n");
      out.write("            \t\t</tr>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                }
            }
            
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <form method=\"post\" action=\"/HF21/servlet/dm_talk\">\r\n");
      out.write("            <div class=\"input-box\">\r\n");
      out.write("                <input type=\"text\" id=\"text\" name=\"text\" placeholder=\"メッセージ...\">\r\n");
      out.write("                <input type=\"hidden\" id=\"follower\" name=\"follower\" value=");
      out.print(follower );
      out.write(">\r\n");
      out.write("                <button onclick=\"sendMessage()\">送信</button>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\t<ul class=\"bottom-menu\" id=\"bottom-menu\">\r\n");
      out.write("\t    <li>\r\n");
      out.write("\t        <a href=\"/HF21/home.jsp\">\r\n");
      out.write("\t        \t<img src=\"image/menu1.png\" alt=\"ホーム\">\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t    </li>\r\n");
      out.write("\t    <li>\r\n");
      out.write("\t        <a href=\"/HF21/Discovery.html\">\r\n");
      out.write("\t        \t<img src=\"image/menu2.png\" alt=\"検索\">\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t    </li>\r\n");
      out.write("\t    <li>\r\n");
      out.write("\t        <a href=\"/HF21/post.jsp\">\r\n");
      out.write("\t        \t<img src=\"image/plus.png\" alt=\"投稿\">\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t    </li>\r\n");
      out.write("\t    <li>\r\n");
      out.write("\t        <a href=\"notice.html\">\r\n");
      out.write("\t        \t<img src=\"image/menu3.png\" alt=\"通知\">\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t    </li>\r\n");
      out.write("\t     <li>\r\n");
      out.write("\t         <a href=\"dm.jsp\">\r\n");
      out.write("\t             <img src=\"image/menu4.png\" alt=\"dm\">\r\n");
      out.write("\t         </a>\r\n");
      out.write("\t     </li>\r\n");
      out.write("\t</ul>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
