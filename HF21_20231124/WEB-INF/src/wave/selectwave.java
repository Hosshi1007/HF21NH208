package wave;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns= {"/servlet/selectwave"})
public class selectwave extends HttpServlet {

	public void doGet(
			HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException {

		PrintWriter out;
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		out = res.getWriter();

		// webブラウザのformからパラメータを取得
		String waveID = req.getParameter("waveID");
		System.out.println(waveID+"waveID");

		try {
			// Beansを呼び出してインスタンス化
			wave.wave_select_Beans wave_select = new wave.wave_select_Beans();

			// プロパティのセット(クラス名)
			wave_select.setFields("w.userID,u.user_name,w.wave_contents,w.imgID1,w.imgID2,w.imgID3,w.imgID4,w.posttime");
			wave_select.setTable("t_wave as w join t_user as u on w.userID = u.userID");
			wave_select.setConditions("waveID = '" + waveID + "'");

			// データベース検索
			wave_select.DBselect();

			//jspへ
			req.setAttribute("wave_select", wave_select);

			//home画面に遷移
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/wave.jsp").forward(req, res);

		}
		// 例外処理
		catch (Exception ex) {
			ex.printStackTrace(out);
		}
	}
}