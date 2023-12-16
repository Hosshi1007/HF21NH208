package wave;

import java.io.File;
import java.util.ArrayList;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

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



	public void get_wave_manyuser() {

		//一旦全部のwaveを取得しますｗｗ
		//後でどのwaveを取得すべきか選別してからselectするやつを別に作るか？
        try {
			//Beanを呼び出してインスタンス化
			wave.wave_select_Beans select_Beans = new wave.wave_select_Beans();

			//プロパティのセット
			//テーブル
			select_Beans.setTable("t_wave as w join t_user as u on w.userID = u.userID");
			//条件　※条件要らないから無理やり
			select_Beans.setConditions("'A' = 'A'");
			//フィールド
			//0:waveID 1:userID 2:user_name 3:user_img 4:wave_contents
			//5:imgID1 6:imgID2 7:imgID3 8:imgID4 9:positime
			select_Beans.setFields("w.waveID,w.userID,u.user_name,u.user_img,w.wave_contents,w.imgID1,w.imgID2,w.imgID3,w.imgID4,w.posttime");
			//日付の新しい順
			select_Beans.setSort("order by posttime desc");
			//Beanコール
			select_Beans.DBselect();

			//結果を取得してreturnする
            //return select_Beans.getTbl();

			//結果をjsonファイルに出力する為の作業を開始

			//結果を取得
			ArrayList wavetbl = select_Beans.getTbl();
			ArrayList userrow = new ArrayList();


			// Javaオブジェクトに値をセット
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

	        ArrayNode jsonArray = objectMapper.createArrayNode();

            // Loop through the result and add each object to the array
            for (int i = 0; i < wavetbl.size(); i++) {
                userrow = (ArrayList) wavetbl.get(i);
                ObjectNode objectNode = createObjectNode(Integer.parseInt(userrow.get(0).toString()));
                jsonArray.add(objectNode);
            }

	        //System.out.println(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(rootNode));

	        // ファイルパスを指定
            String filePath = "C:/java_workspace/HF21/wave.json";
            // ファイルに書き込む
            objectMapper.writeValue(new File(filePath), jsonArray);
		}
		catch(Exception ex) {
            System.out.println(ex);
		}
	}


	// 各ObjectNodeを生成するメソッド
	 private static ObjectNode createObjectNode(int index) {
	        try {
	            wave.wave_select_Beans select_Beans = new wave.wave_select_Beans();
	            select_Beans.setTable("t_wave as w join t_user as u on w.userID = u.userID");
	            select_Beans.setConditions("w.waveID = '" + index + "'");
	            select_Beans.setFields("w.waveID,w.userID,u.user_name,u.user_img,w.wave_contents,w.imgID1,w.imgID2,w.imgID3,w.imgID4,w.posttime");

	            select_Beans.DBselect();

	            ArrayList wavetbl = select_Beans.getTbl();
	            ArrayList userrow = (ArrayList) wavetbl.get(0);

	            ObjectMapper objectMapper = new ObjectMapper();
	            ObjectNode objectNode = objectMapper.createObjectNode();

	            // Constructing the desired JSON structure
	            objectNode.put("waveID", Integer.parseInt(userrow.get(0).toString()));
	            objectNode.put("username", userrow.get(2).toString());
	            objectNode.put("userid", userrow.get(1).toString());
	            objectNode.put("user_img", userrow.get(3).toString());
	            objectNode.put("time", 1); // Assuming "time" is hardcoded to 1 in your example
	            objectNode.put("maincontent", userrow.get(4).toString());
	            objectNode.put("imgID1", userrow.get(5).toString());
	            objectNode.put("imgID2", userrow.get(6).toString());
	            objectNode.put("imgID3", userrow.get(7).toString());
	            objectNode.put("imgID4", userrow.get(8).toString());
	            objectNode.put("posttime", userrow.get(9).toString());
	            objectNode.put("heart", 3); // Assuming "heart" is hardcoded to 3 in your example
	            objectNode.put("rewave", 5); // Assuming "rewave" is hardcoded to 5 in your example

	            // Return the constructed objectNode
	            return objectNode;
	        } catch (Exception ex) {
	            System.out.println(ex);
	            return null;
	        }
	 }


}