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

@WebServlet(urlPatterns= {"/servlet/getwave_servlet"})
public class getwave_servlet extends HttpServlet{
	public void doPost(
		HttpServletRequest req,
		HttpServletResponse res
	)
	throws ServletException,IOException{

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

        // セッションを取得
        HttpSession session = req.getSession();
		// セッションデータ受け取り
        String session_userID = (String) session.getAttribute("session_userID");

		public void class getallwave_oneuser() {
		
			
		}



		try {
			//Beanを呼び出してインスタンス化
			wave.wave_select_Beans select_Beans = new wave.wave_select_Beans();

			//プロパティのセット
			//テーブル
			select_Beans.setTable("t_wave");
			//条件
			select_Beans.setConditions("userID= '" + session_userID + "'");
			//フィールド
			select_Beans.setFields("*");
			//日付の新しい順
			select_Beans.setSort("order by posttime desc");
			//Beanコール
			select_Beans.DBselect();
			//結果をjspに送信
			if(select_Beans.getHit_flag()){
				req.setAttribute("wave", select_Beans.getTbl());
				req.setAttribute("status","reload");
				//home画面に遷移
				ServletContext sc = getServletContext();
				sc.getRequestDispatcher("/HF21/home.jsp").forward(req, res);
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
