package wave;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = { "/servlet/signup" })

public class signup extends HttpServlet {

	public void doPost(
			HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException {
		PrintWriter out;
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		out = res.getWriter();

		// webブラウザのformからパラメータを取得
		String user_name = req.getParameter("user_name");
		String userID = req.getParameter("userID");
		String user_pass = req.getParameter("user_pass");

		//userIDの重複判定フラグ
		//0:重複なし 1:重複あり
		int hit_flag = 0;

		//↓フロントでチェックする方がいいから一旦コメントアウト
		//String re_pass = req.getParameter("re_user_pass");

		/*
		// パスワードチェック
		int pass_check = 0;
		if (pass.equals(re_pass)) {
		} else {
			// HTMLファイルにリダイレクト
			pass_check = 1;
		}
		*/
		//↑フロントでチェックする方がいいから一旦コメントアウト

		// パスワードが正しければ
		try {
			// Beansを呼び出してインスタンス化
			Beans.wave_select_Beans2 select_Beans = new Beans.wave_select_Beans2();

			// プロパティのセット(クラス名)
			select_Beans.setFields("*");
			select_Beans.setTable("t_user");
			select_Beans.setJyouken("userID = '" + userID + "'");

			// データベース検索
			select_Beans.DBselect();

			// 重複判定
			hit_flag = select_Beans.getHit_flag();

			//デバッグ用
			System.out.println(hit_flag);

			// 重複がなければ
			if (hit_flag == 0) {
				//insert用Bean用意
				wave.wave_insert_bean insert_bean = new wave.wave_insert_bean();

				// プロパティのセット(クラス名)
				insert_bean.setTable("t_user");
				insert_bean.setFields("userID,user_name,user_password");
				insert_bean.setValues(userID + "','" + user_name + "','" + user_pass);


				// データベース挿入
				insert_bean.DBinsert();

				//セッション開始
				HttpSession session = req.getSession(true);
	    		session.setMaxInactiveInterval(36000);
	    		session.setAttribute("session_user_name", user_name);
	    		session.setAttribute("session_userID", userID);

				// JSPコール
				ServletContext sc = getServletContext();
				req.setAttribute("userID", userID);
				req.setAttribute("user_name", user_name);
				sc.getRequestDispatcher("/home.jsp").forward(req, res);
			}
		}
		// 例外処理
		catch (Exception ex) {
			ex.printStackTrace(out);
		}
	}
}