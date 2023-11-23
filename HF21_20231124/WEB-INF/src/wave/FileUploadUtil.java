package wave;

import javax.servlet.http.Part;

public class FileUploadUtil {

    public static String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");

        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                System.out.println(item.substring(item.indexOf("=") + 2, item.length() - 1) + "fff");
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
