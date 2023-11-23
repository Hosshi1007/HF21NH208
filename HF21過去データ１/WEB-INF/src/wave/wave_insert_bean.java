package wave;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns={"/servlet/wave_insert_bean"})

public class wave_insert_bean implements Serializable{

	//データベース接続定義
	//DBURL
	final String URL = "jdbc:mysql://localhost/db_wave?useUnicode=true&characterEncording=UTF-8";
	/* DBユーザー */
	final String USER = "root";

	/* DBパスワード */
	final String PASSWORD = "root";

	/* DB:ドライバ */
	final String DRIVER = "org.gjt.mm.mysql.Driver";

	Connection con = null;
	Statement stmt = null;

	//プロパティ定義
	int hit_flag;
	String jyouken = "";
	String jyouken2 = "";
	String values = "";
	String table_name = "";
	String fields = "*";
	String fields2 = "*";
	String fields3 = "*";
	String sort = "";
	String select_no = "";

	//登録するsyusseki_no格納
	int next_syusseki_no = 0;
	String next_syusseki_noStr = "";
	//登録するgakuseki_no格納
	int next_gakuseki_no = 0;
	String next_gakuseki_noStr = "";

	//コンストラクタ定義
	public wave_insert_bean() {
		super();
	}


	//DBアクセス
	public void DBinsert() {
		try {
			//MySQLDriverローディング
			Class.forName(DRIVER);
			//MySQLへの接続
			con = DriverManager.getConnection(URL,USER,PASSWORD);
			//SQL格納
			stmt = con.createStatement();
			//SB用意
			StringBuffer query = new StringBuffer();

			//insert文構築
			query = new StringBuffer();
			query.append("insert into ");
		    query.append(table_name);
		    query.append(" (");
			query.append(fields);
			query.append(") values('");
			query.append(values);
			query.append("')");
			hit_flag = 1;
			System.out.println(query.toString());
			stmt.executeUpdate(query.toString());

			//切断
			stmt.close();
			con.close();
		}//try終わり

		//例外処理
		catch(SQLException ex){
			hit_flag = 0;
			ex.printStackTrace();
		}
		catch(Exception ex){
			ex.printStackTrace();
			hit_flag = 0;
		}
	}

	//アクセスメソッドsetter
	public void setTable(String inTable) {
		table_name = inTable;
	}

	public void setFields(String inFields) {
		fields = inFields;
	}

	public void setJyouken(String inJyouken) {
		jyouken = inJyouken;
	}

	public void setValues(String inValues) {
		values = inValues;
	}

	public void setSort(String inSort) {
		sort = inSort;
	}

	//getterメソッド
	public int getHit_flag() {
		return hit_flag;
	}

}




