package wave;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = { "/servlet/ImageUploadServlet" })

@MultipartConfig(maxFileSize = 10000000, maxRequestSize = 10000000, fileSizeThreshold = 10000000)

public class ImageUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // セッションデータ受け取り
        // セッションを取得
        HttpSession session = request.getSession();
        String session_userID = (String) session.getAttribute("session_userID");

        // waveの文字部分を取得
        String wave_text = request.getParameter("wave_text");
        // 改行文字列を <br> タグに変換
        wave_text = wave_text.replaceAll("\r\n|\r|\n", "<br>");

        // 画像のfilename格納用
        String Filename[] = { "none", "none", "none", "none" };
        int i = 0;

        // ファイルを保存するローカルフォルダのパスを指定
        String uploadFolder = "c:/java_workspase/HF21/image";

        try {
            Collection<Part> fileParts = request.getParts();

            for (Part filePart : fileParts) {
                String fileName = FileUploadUtil.extractFileName(filePart);
                if (fileName.equals("")) {
                    continue;
                }
                Filename[i] = "/HF21/image/" + fileName;
                File destination = new File(uploadFolder + File.separator + fileName);
                System.out.println(destination.getAbsolutePath());
                filePart.write(destination.getAbsolutePath());
                i++;
            }

            // 現在の日時を取得
            LocalDateTime now = LocalDateTime.now();
            // フォーマットを指定して表示
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = now.format(formatter);

            // insert用Bean用意
            wave.wave_insert_bean insert_bean = new wave.wave_insert_bean();

            // プロパティのセット
            insert_bean.setTable("t_wave");
            insert_bean.setSort("posttime desc");

            insert_bean.setFields("userID,wave_contents,posttime,imgID1,imgID2,imgID3,imgID4");
            insert_bean.setValues(session_userID + "','" + wave_text + "','" + formattedDateTime + "','"
                    + Filename[0] + "','" + Filename[1] + "','" + Filename[2] + "','" + Filename[3]);

            // insert実行
            insert_bean.DBinsert();
            //home画面に遷移
            // Servlet内でのリダイレクト
            response.sendRedirect("/HF21/home.jsp");


        } catch (Exception e) {
            response.getWriter().println("アップロードに失敗しました。");
            e.printStackTrace(response.getWriter());
        }
    }
}
