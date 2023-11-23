package wave;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Caltime {
    public String caltime(String target) {
        // 特定の日時を指定
        String targetDateTimeString = target;

        // 現在の日時を取得
        Date now = new Date();

        // 特定の日時を Date オブジェクトに変換
        Date targetDateTime = parseStringToDate(targetDateTimeString);

        // 差を計算
        long timeDifference = calculateTimeDifference(targetDateTime, now);

        // 差を時間単位で取得
        long hours = timeDifference / (1000 * 60 * 60);
        long minutes = (timeDifference % (1000 * 60 * 60)) / (1000 * 60);
        long seconds = (timeDifference % (1000 * 60)) / 1000;

        // 結果を表示
        //System.out.println("現在日時との時間の差: " + hours + " 時間 " + minutes + " 分 " + seconds + " 秒");

        if (hours >= 24) {
            return String.valueOf(hours / 24) + "日前";
        } else if (hours >= 1) {
            return String.valueOf(hours) + "時間前";
        } else if (minutes >= 1) {
            return String.valueOf(minutes) + "分前";
        } else {
            return String.valueOf(seconds) + "秒前";
        }
    }

    // 文字列を Date オブジェクトに変換するメソッド
    private static Date parseStringToDate(String dateString) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return dateFormat.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 差を計算するメソッド
    private static long calculateTimeDifference(Date startDateTime, Date endDateTime) {
        return endDateTime.getTime() - startDateTime.getTime();
    }
}
