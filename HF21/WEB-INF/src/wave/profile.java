package wave;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns= {"/servlet/login"})
public class login extends HttpServlet{
	public void doPost(
		HttpServletRequest req,
		HttpServletResponse res
	)
	throws ServletException,IOException{

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

        //セッション取得
        HttpSession session = req.getSession();

		//セッションからパラメータを取得
		String session_userIDStr = req.getParameter("session_userID");
		String session_user_nameStr = req.getParameter("session_user_name");

        if(session_userIDStr = null){
    		res.sendRedirect("HF21/login.html");
        }else{

            //表示するユーザIDを取得
            String userIDStr = req.getParameter("userID");

            ArrayList tbl = new ArrayList();
            ArrayList row = new ArrayList();

            try {
                //投稿数
                    //Beanを呼び出してインスタンス化
                    Beans.wave_select_Beans select_Beans = new Beans.wave_select_Beans();

                    //プロパティのセット
                    //テーブル
                    select_Beans.setTable("t_wave");
                    //条件
                    select_Beans.setConditions("userID like '" + userIDStr + "'");
                    //フィールド
                    select_Beans.setFields("count(*)");

                    //Beanコール
                    select_Beans.DBselect();

                    //数値を変数に格納

                    int wave_count = 0;

                    if(select_Beans.getHit_flag){
                        tbl = select_Beans.getTbl();
                        row = (ArrayList)tbl.get(0);

                        wave_count = Integer.parseInt((String)row.get(0));
                    }

                //フォロー数
                    //Beanを呼び出してインスタンス化
                    select_Beans = new Beans.wave_select_Beans();

                    //プロパティのセット
                    //テーブル
                    select_Beans.setTable("t_follow");
                    //条件
                    select_Beans.setConditions("be_follow like '" + userIDStr + "'");
                    //フィールド
                    select_Beans.setFields("count(*)");

                    //Beanコール
                    select_Beans.DBselect();

                    //数値を変数に格納

                    int follow_count = 0;

                    if(select_Beans.getHit_flag){
                        tbl = select_Beans.getTbl();
                        row = (ArrayList)tbl.get(0);

                        follow_count = Integer.parseInt((String)row.get(0));
                    }

                //フォロワー数
                    //Beanを呼び出してインスタンス化
                    select_Beans = new Beans.wave_select_Beans();

                    //プロパティのセット
                    //テーブル
                    select_Beans.setTable("t_follow");
                    //条件
                    select_Beans.setConditions("tofollow like '" + userIDStr + "'");
                    //フィールド
                    select_Beans.setFields("count(*)");

                    //Beanコール
                    select_Beans.DBselect();

                    //数値を変数に格納

                    int follower_count = 0;

                    if(select_Beans.getHit_flag){
                        tbl = select_Beans.getTbl();
                        row = (ArrayList)tbl.get(0);

                        follower_count = Integer.parseInt((String)row.get(0));
                    }

                //ID,ユーザ名,コメント,アイコン
                    //Beanを呼び出してインスタンス化
                    select_Beans = new Beans.wave_select_Beans();

                    //プロパティのセット
                    //テーブル
                    select_Beans.setTable("t_user");
                    //条件
                    select_Beans.setConditions("userID like '" + userIDStr + "'");
                    //フィールド
                    select_Beans.setFields("userID,user_name,comment,user_img");

                    //Beanコール
                    select_Beans.DBselect();

                //JSPコール
                req.setAttribute("wave_count", wave_count);//投稿数
                req.setAttribute("follow_count", follow_count);//フォロー数
                req.setAttribute("follower_count", follower_count);//フォロワー数
                req.setAttribute("select_Beans", select_Beans);//ID,ユーザ名,コメント,アイコン
                ServletContext sc = getServletContext();
                sc.getRequestDispatcher("/profile.jsp").forward(req, res);
            }
            catch(Exception ex) {
                PrintWriter out;
                req.setCharacterEncoding("UTF-8");
                res.setContentType("text/html;charset=UTF-8");
                out = res.getWriter();
                ex.printStackTrace(out);
            }
        }
	}
}
