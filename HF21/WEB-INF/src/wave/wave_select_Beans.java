package wave;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class wave_select_Beans implements Serializable{
	//DB接続定義
	/* DB:URL*/
	final String URL = "jdbc:mysql://localhost/db_wave?useUnicode=true&characterEncoding=UTF-8";

	/* DB:ユーザ*/
	final String USER = "root";

	/* DB:パスワード*/
	final String PASS = "root";

	/* DB:ドライバ*/
	final String DRIVER = "org.gjt.mm.mysql.Driver";

	Connection con = null;
	Statement stmt = null;

	//プロパティ定義
	boolean hit_flag = false;
	String Conditions = "";
	String table_name = "";
	String fields = "*";
	String sort = "";
	ArrayList tbl = new ArrayList();

	//コンストラクタ定義
	public wave_select_Beans() {
		super();
	}

	//DBアクセス
	public void DBselect() {
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
			query.append("select ");
			query.append(fields);
			query.append(" from ");
			query.append(table_name);
			query.append(" where ");
			query.append(Conditions);
			query.append(" ");
			query.append(sort);
			System.out.println(query.toString());
			ResultSet rs = stmt.executeQuery(query.toString());
			//テーブル情報取得
			ResultSetMetaData rsmd = rs.getMetaData();
			System.out.println(rsmd.getColumnCount());

			//検索結果取得
			if(rs.next()) {
				hit_flag = true;
				if(rsmd.getColumnCount() == 1 && rs.getString(1) == null) {
					//該当するものが無いときにnullを返す
					ArrayList row = new ArrayList();
					row.add(null);
					tbl.add(row);
				}else {
					do {
						ArrayList row = new ArrayList();
						//System.out.println("a");
						for(int i=1;i<=rsmd.getColumnCount();i++) {
							try {
								row.add(rs.getObject(i).toString());
							}
							catch(Exception ex) {
								ex.printStackTrace();
							}
						}
						//System.out.println("c");
						tbl.add(row);
					}while(rs.next());
				}
			}else {
				hit_flag = false;
			}

			//切断
			rs.close();
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

	//アクセスメソッド(setter)
	public void setTable(String inTable) {
		//テーブル名をそのまま入力(例:"t_user")
		table_name = inTable;
	}

	public void setFields(String inFields) {
		//フィールド名をカンマ(,)区切りで入力(例:"user_name,user_password")
		fields = inFields;
	}

	public void setConditions(String inConditions) {
		//where句を入力(例:"user_name = '山田太郎' and user_ID = '00001'")
		//※現在、where句は入る前提なので、全件検索が必要な場合は坂口にお伝え頂ければ改善致します
		Conditions = inConditions;
	}

	public void setSort(String inSort) {
		//※並べ替えをする場合、order byから書いてください(空白は補完してあるので不要)
		//(例:"order by user_ID desc")
		sort = inSort;
	}

	//アクセサメソッド(getter)
	public boolean getHit_flag() {
		//該当レコードが存在するかを返す
		return hit_flag;
	}

	public ArrayList getTbl() {
		//表出力
		return tbl;
	}
}
