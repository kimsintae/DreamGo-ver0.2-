package test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySqlConnectionTest {

	private static final String DRIVER=
			"com.mysql.jdbc.Driver";
	private static final String URL=
			"jdbc:mysql://127.0.0.1:3306/dreamgo";
	private static final String USER=
			"root";
	private static final String PASSWORD=
			"12345678";
	
	@Test
	public void testConn()throws Exception{
		Class.forName(DRIVER);
		
		try{
			Connection con = DriverManager.getConnection(URL,USER,PASSWORD);
			System.out.println(con);
		}catch(Exception e){
			e.printStackTrace();
		};
	}
}
