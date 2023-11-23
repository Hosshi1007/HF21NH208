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

		//webブラウザのFormページからパラメータを取得
		String userIDStr = req.getParameter("userID");
		String passwordStr = req.getParameter("password");

		boolean login = false;
		ArrayList tbl = new ArrayList();
		ArrayList row = new ArrayList();

		try {
			//Beanを呼び出してインスタンス化
			Beans.wave_select_Beans select_Beans = new Beans.wave_select_Beans();

			//プロパティのセット
			//テーブル
			select_Beans.setTable("t_user");
			//条件
			select_Beans.setConditions("userID like '" + userIDStr + "'");
			//フィールド
			select_Beans.setFields("*");

			//Beanコール
			select_Beans.DBselect();

			//パスワードが一致しているか確認
			if(select_Beans.getHit_flag()) {//ユーザ名が存在するか確認
				tbl = select_Beans.getTbl();
				row = (ArrayList)tbl.get(0);

				if(passwordStr.equals((String)row.get(2))) {
					//System.out.println((String)row.get(1));
					login = true;
				}
			}

			if(login){//ログイン成功
				HttpSession session = req.getSession();

				//有効時間(10分)
				session.setMaxInactiveInterval(600);

				//セッションにバインド
				session.setAttribute("session_userID",(String)row.get(0));//ログインID
				session.setAttribute("session_user_name",(String)row.get(1));//ユーザー名
				//session.setAttribute("login_name",userStr);//ログイン名

				//メイン画面に遷移
				res.sendRedirect("/HF21/home.jsp");//適当に命名しているので決まり次第変更お願いします


			}else{//ユーザ名かパスワードが間違っている場合
				//JSPコール
				req.setAttribute("userID", userIDStr);
				ServletContext sc = getServletContext();
				sc.getRequestDispatcher("/login.jsp").forward(req, res);
			}
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
