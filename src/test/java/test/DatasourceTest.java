package test;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
//root-context.xml,servelt-context.xml 에 등록된 빈 가져오기
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DatasourceTest {

	@Inject
	private DataSource ds;
	
	@Test
	public void test()throws Exception{
		try{
			Connection conn = ds.getConnection();
			System.out.println(conn);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
