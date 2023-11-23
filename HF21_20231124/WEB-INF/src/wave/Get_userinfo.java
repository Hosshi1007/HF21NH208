package wave;

import java.util.ArrayList;

public class Get_userinfo {

    public ArrayList get_userinfo_oneuser(String userID) {
		//特定のuserIDのuserinfoを取得してArrayList型で返すメソッド

        try {
			//Beanを呼び出してインスタンス化
			wave.wave_select_Beans get_userinfo = new wave.wave_select_Beans();
			//プロパティのセット
			//テーブル
			get_userinfo.setTable("t_user");
			//条件
			get_userinfo.setConditions("userID = '" + userID + "'");
			//フィールド
			get_userinfo.setFields("userID,user_name,user_img");
			//テーブル情報　0:userID,1:user_name,2:user_password,3:comment,4:user_img
			
			//select実行
			get_userinfo.DBselect();
			//結果を取得してreturnする
            return get_userinfo.getTbl();
		}
		catch(Exception ex) {
            System.out.println(ex);
            return null;
		}
	}
}