package wave;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns={"/servlet/wave_select_Beans2"})

public class wave_select_Beans2 implements Serializable{

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
	String table_name = "";
	String fields = "*";
	String sort = "";
	ArrayList<String> tbl =  new ArrayList<String>();

	//コンストラクタ定義
	public wave_select_Beans2() {
		super();
	}


	//DBアクセス
	public void DBselect() {
		try {
			//MySQLDriverローディング
			Class.forName(DRIVER);
			//MySQLへの接続
			con = DriverManager.getConnection(URL,USER,PASSWORD);
			//SQL格納
			stmt = con.createStatement();
			//SB用意
			StringBuffer query = new StringBuffer();
			//resultset用意
			ResultSet rs = null;

			//form内容でSQL構築
			query.append("select ");
			query.append(fields);
			query.append(" from ");
		    query.append(table_name);
			query.append(" where ");
			query.append(jyouken);
			query.append(" ");
			query.append(sort);
			System.out.println(query.toString());
			rs = stmt.executeQuery(query.toString());

			//テーブル情報取得
			ResultSetMetaData rsmd = rs.getMetaData();

			//検索結果取得
			if(rs.next()) {
				hit_flag = 1;
				ArrayList<String> row = new ArrayList<String>();
				for(int i=1; i<= rsmd.getColumnCount(); i++) {
					try {
						row.add(rs.getObject(i).toString());
					}

					catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				tbl.addAll(row);
			}else {
				hit_flag = 0;
			}
			//切断
			rs.close();
			stmt.close();
			con.close();
		}//try終わり

		//例外処理
		catch(SQLException ex){
			ex.printStackTrace();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

	//Setterメソッド　Servlet→Bean
	public void setTable(String inTable) {
		table_name = inTable;
	}
	public void setFields(String inFields) {
		fields = inFields;
	}
	public void setJyouken(String inJyouken) {
		jyouken = inJyouken;
	}
	public void setSort(String inSort) {
		sort = inSort;
	}

	//getterメソッド　Bean→Servlet・JSP
	public int getHit_flag() {
		return hit_flag;
	}

	public ArrayList<String> getTbl() {
		return tbl;
	}
}