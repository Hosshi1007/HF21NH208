package wave;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/servlet/discovery"})
public class discovery extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		//出力の宣言
		PrintWriter out = response.getWriter();;

		//入力エンコーディング
		request.setCharacterEncoding("UTF-8");

		//出力エンコーディング
		response.setContentType("text/html;charset=UTF-8");

		//言語設定
		response.setHeader("Content-Language", "ja");

		try {
/*
			// 宣言とパスの指定
			File directory = new File("/HF21/image/test_image");
			System.out.println("directory ＝ " + directory);

			//指定のパスがファイルであるか？
			if (directory.isFile()) {

				System.out.println("指定のパスはファイルである");

				// ディレクトリ内のファイル一覧を取得
				File[] files = directory.listFiles();

				System.out.println("取得したファイル：" + files);

				// カウンターを初期化
				int imageCount = 0;

				// ディレクトリ内のファイルの数だけループして、画像ファイルをカウント
				for (File file : files) {
					if (file.isFile() && isImageFile(file.getName())) {
						imageCount++;
					}
				}

				// 画像ファイルの数を出力
				response.setContentType("text/plain");
				System.out.println("画像ファイルの数：" + imageCount);

				//Servlet→JSP Set
				request.setAttribute("imageCount",imageCount);
				ServletContext sc=getServletContext();
				sc.getRequestDispatcher("/discovery.jsp").forward(request,response);

			} else {
				System.out.println("指定のパスはファイルではない");
			}

			//directoryが存在するか？
			if(directory.exists()){
				System.out.println("directoryが存在する");
			} else {
				System.out.println("directoryが存在しない");
			}
*/
		}//try end
		catch(Exception ex) {
			ex.printStackTrace(out);
		}
	}
/*
	// 画像ファイルかどうかを拡張子で判定するメソッド
	private boolean isImageFile(String fileName) {
		return fileName.toLowerCase().endsWith(".jpg") ||
				fileName.toLowerCase().endsWith(".png") ||
				fileName.toLowerCase().endsWith(".gif");
	}
*/
}
