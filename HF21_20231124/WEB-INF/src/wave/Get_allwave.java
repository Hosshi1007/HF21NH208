package wave;

import java.util.ArrayList;

public class Get_allwave {

    public ArrayList get_allwave_oneuser(String userID) {


        try {
			//Beanを呼び出してインスタンス化
			wave.wave_select_Beans select_Beans = new wave.wave_select_Beans();

			//プロパティのセット
			//テーブル
			select_Beans.setTable("t_wave");
			//条件
			select_Beans.setConditions("userID= '" + userID + "'");
			//フィールド
			select_Beans.setFields("*");
			//日付の新しい順
			select_Beans.setSort("order by posttime desc");
			//Beanコール
			select_Beans.DBselect();
			//結果を取得してreturnする
            return select_Beans.getTbl();
		}
		catch(Exception ex) {
            System.out.println(ex);
            return null;
		}
	}
}