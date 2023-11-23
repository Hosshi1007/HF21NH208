package Beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class wave_insert_Beans implements Serializable{
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
	String fields = "*";

	//コンストラクタ定義
	public DBinsert_Beans() {
		super();
	}

	//DBアクセス
	public void DBinsert() {
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
			query.append("insert into ");
			query.append(table_name);
			query.append(" (");
			query.append(fields);
			query.append(") values (");
			query.append(Conditions);
			query.append(")");

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
	public void setFields(String inFields) {
		//フィールド名をカンマ(,)区切りで入力(例:"user_name,user_password")
		fields = inFields;
	}
	public void setstatus(String instatus) {
		//登録内容をカンマ区切りで入力(例:"sakaguchi,pass12345")
		Conditions = instatus;
	}

	//アクセサメソッド(getter)
}
