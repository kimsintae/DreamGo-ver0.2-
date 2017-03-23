package test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamgo.domain.UserVO;
import com.dreamgo.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class InsertTest {

	@Inject
	private UserDAO dao;
	
/*	@Test
	public void test()throws Exception{
		UserVO user = new UserVO();
		user.setEmail("test@naver.com");
		user.setPassword("12345678");
		user.setNickname("JAVAMASTER");
		user.setProfile("");
		user.setDream("웹프로그래머");
		user.setType('U');
		dao.insertUser(user);
	}*/
}
