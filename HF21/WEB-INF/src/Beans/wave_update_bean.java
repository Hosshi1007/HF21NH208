package Beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class wave_update_bean implements Serializable{
	//DB接続定義
	/* DB:URL*/
	final String URL = "jdbc:mysql://localhost/nhs20733db?useUnicode=true&characterEncoding=UTF-8";

	/* DB:ユーザ*/
	final String USER = "root";

	/* DB:パスワード*/
	final String PASS = "root";

	/* DB:ドライバ*/
	final String DRIVER = "org.gjt.mm.mysql.Driver";

	Connection con = null;
	Statement stmt = null;

	//プロパティ定義
	String Conditions = "";
	String table_name = "";
	String status = "";

	//コンストラクタ定義
	public DBupdate_bean() {
		super();
	}

	//DBアクセス
	public void DBupdate() {
		try {
			//MySQLローディング
			Class.forName(DRIVER);
			//MySQLへの接続
			con = DriverManager.getConnection(URL, USER, PASS);
			//SQL格納
			stmt = con.createStatement();
			//SQL実行
			Statement stmt = con.createStatement();
			StringBuffer query = new StringBuffer();
			query.append("update ");
			query.append(table_name);
			query.append(" set ");
			query.append(status);
			query.append(" where ");
			query.append(Conditions);

			System.out.println(query.toString());

			stmt.executeUpdate(query.toString());

			//切断
			stmt.close();
			con.close();

		}
		//例外処理
		catch(SQLException ex) {
			ex.printStackTrace();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	//アクセサメソッド(setter)
	public void setTable(String inTable) {
		//テーブル名をそのまま入力(例:"t_user")
		table_name = inTable;
	}
	public void setStatus(String inStatus) {
		//更新内容を「列名」=「値」の形でカンマ(,)区切りにして入力
		//(例:"user_name = '佐藤次郎',password = 'root123'")
		status = inStatus;
	}
	public void setConditions(String inConditions) {
		//更新するレコードの主キーを指定する
		//(例:"user_ID = '00001'")
		Conditions = inConditions;
	}

	//アクセサメソッド(getter)
}
