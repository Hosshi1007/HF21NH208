package wave;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns={"/servlet/imgsend2"})
@MultipartConfig(
		maxFileSize=10000000,
		maxRequestSize=10000000,
		fileSizeThreshold=10000000
	)

public class imgsend2 extends HttpServlet{

	public static SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");

	public void doPost(HttpServletRequest req,HttpServletResponse res )throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

		//Form送信データを取得
		//String class_no = req.getParameter("CLASS_NO");
		Part part = req.getPart("logo");
		String logo = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		System.out.println(logo);
		String logo_name = logo.isEmpty() ? "" : logo;
		// 画像アップロード
		String path = getServletContext().getRealPath("/image");
		part.write(path + File.separator + logo_name);

		//logに画像ファイル名受け渡し
		LogWriter ImgNameSend = new LogWriter();
		ImgNameSend.writeLog(logo);

		 try {
			    String pypath = "C:/java_workspase/HF21/facercg.py";
			    ProcessBuilder builder = new ProcessBuilder("py", pypath);
			    System.out.println(pypath);
			    Process process = builder.start();
			    int exitCode = process.waitFor();
			    if (exitCode==0) {
			      process.destroy();
			    }
				ServletContext sc = getServletContext();
				req.setAttribute("filename", logo);
				sc.getRequestDispatcher("/imgsend3.jsp").forward(req,res);
			  }
			  catch (IOException e) {
			    e.printStackTrace();
			  }
			  catch(InterruptedException ex) {
			    ex.printStackTrace();
			  }

	}
class LogWriter{
    public synchronized void writeLog(String text){
        Calendar calendar = Calendar.getInstance();

        String OUTPUT_DIR= "C:/java_workspase/HF21/log";

        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        Date date = calendar.getTime();

        String yearStr = String.format("%04d", year);
        String monthStr = String.format("%02d", month);

        //　ログ出力
        String file_name = OUTPUT_DIR + File.separator + yearStr + "_" + monthStr + ".log";
        File file = new File(file_name);
        FileWriter fw = null;
        String line = sdf.format(date) + ":" +  text;
        try{
            fw = new FileWriter(file, true);
            fw.write(line + "\n");
        }catch(IOException e){
            e.printStackTrace();
        }finally {
            if(fw != null) {
                try {
                    fw.close();
                }catch(Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
    }
}
}