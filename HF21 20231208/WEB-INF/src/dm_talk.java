import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.AESEncryption;

@WebServlet(urlPatterns = { "/servlet/dm_talk" })
public class dm_talk extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // 文字コードの指定
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");

        String text = req.getParameter("text");
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // 現在の時刻を取得
        String name = "自分"; // 送信者の名前（自分として固定）
        String follower = req.getParameter("follower");

        // テキストを暗号化
        try {
            text = AESEncryption.encrypt(text);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // データベースに接続するために使用する変数設定
        Connection con = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;

        // ローカルMySQLに接続する設定
        String USER = "root";
        String PASSWORD = "";
        String URL = "jdbc:mysql://localhost/hf21";
        String DRIVER = "com.mysql.jdbc.Driver";

        // 確認メッセージ
        StringBuffer ERMSG = null;

        try {
            // MySQLDriverローディング
            Class.forName(DRIVER);
            // MySQLへの接続
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            // SQL格納
            stmt = con.createStatement();
            // SB用意
            StringBuffer query = new StringBuffer();

            // PreparedStatementオブジェクト作成（挿入クエリ）

            query = new StringBuffer();
            query.append("INSERT INTO dm (name, time, text, follower) VALUES ('");
            query.append(name);
            query.append("','");
            query.append(time);
            query.append("','");
            query.append(text);
            query.append("','");
            query.append(follower);
            query.append("')");
            System.out.println(query.toString());
            stmt.executeUpdate(query.toString());

        } catch (ClassNotFoundException | SQLException e) {
            ERMSG = new StringBuffer();
            ERMSG.append(e.getMessage());
        } finally {
            // リソースのクローズ
            try {
                if (pstmt != null)
                    pstmt.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                ERMSG = new StringBuffer();
                ERMSG.append(e.getMessage());
            }
        }

        // getした値をそのままjspに送る用
        req.setAttribute("follower", follower);
        ServletContext sc = getServletContext();
        sc.getRequestDispatcher("/dm_talk2.jsp").forward(req, res);
    }
}