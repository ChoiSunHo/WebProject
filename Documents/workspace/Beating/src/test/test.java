package test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import Member.MemberDTO;
import Member.MemberDAO;


// 데이터베이스 연동 테스트를 위한 클래스
// 프로젝트와는 무관

public class test {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.compareMember("hong", "1234");
		dto = dao.selectMember("test");
		dto.toString();
	}

}