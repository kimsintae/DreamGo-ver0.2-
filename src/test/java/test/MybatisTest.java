package test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {

	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void test(){
		System.out.println(sqlSessionFactory);
	}
	
	@Test
	public void testSession()throws Exception{
		try {
			SqlSession session=sqlSessionFactory.openSession();
			
			System.out.println(session);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
