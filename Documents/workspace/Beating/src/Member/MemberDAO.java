package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Encrypt.SHAEncrypter;


public class MemberDAO {
	private Connection conn;
	private ResultSet rs;
	private MemberDTO dto;
	private SHAEncrypter encrypter;
	
	public MemberDAO(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_b","root","1234");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		encrypter = new SHAEncrypter();
	}
	
	public int updateMember(MemberDTO memberDTO){
	String SQL  = "UPDATE member SET PW=?, NAME=?, ADDR=?, PHONE=? WHERE ID=?";
			
			
			try{
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, encrypter.SHA256(memberDTO.getMemberPw()));
				pstmt.setString(2, memberDTO.getMemberName());
				pstmt.setString(3, memberDTO.getMemberAddr());
				pstmt.setString(4, memberDTO.getMemberPhone());
				pstmt.setString(5, memberDTO.getMemberId());
	
				return pstmt.executeUpdate();
			}catch (Exception e){
					e.printStackTrace();
				}
			return -1; //db ����
	}
	
	public int addMember(MemberDTO memberDTO){
		String SQL  = "INSERT INTO member VALUES(?,?,?,?,?,?)";
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, encrypter.SHA256(memberDTO.getMemberPw()));
			pstmt.setString(3, memberDTO.getMemberName());
			pstmt.setString(4, memberDTO.getMemberAddr());
			pstmt.setString(5, memberDTO.getMemberPhone());
			pstmt.setInt(6, memberDTO.getMemberPower());

			return pstmt.executeUpdate();
		}catch (Exception e){
				e.printStackTrace();
			}
		return -1; //db ����
	}
	
	public MemberDTO selectMember(String id){
		String SQL = "SELECT * FROM MEMBER WHERE ID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemberDTO();
				
				// 로그인 성공 
				dto.setMemberId(rs.getString(1));
				dto.setMemberPw(rs.getString(2));
				dto.setMemberName(rs.getString(3));
				dto.setMemberAddr(rs.getString(4));
				dto.setMemberPhone(rs.getString(5));
				dto.setMemberPower(rs.getInt(6));
				
				return dto;
			} else {
				// 아이디가 없을 경우 
				dto = new MemberDTO();
				dto.setMemberId("noid");
				return dto;
			}
		}catch (Exception e){
				e.printStackTrace();
			}
		return null;
}

	
	public MemberDTO compareMember(String id, String pw){
		String SQL = "SELECT * FROM MEMBER WHERE ID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemberDTO();
				
				//pw 암호화 
					pw = encrypter.SHA256(pw);
				
				//pw가 틀렸을 경우 
				if ( !rs.getString(2).equals(pw)){
					dto.setMemberId("incorrectpw");
					return dto;
				}
				
				// 로그인 성공 
				dto.setMemberId(rs.getString(1));
				dto.setMemberPw(rs.getString(2));
				dto.setMemberName(rs.getString(3));
				dto.setMemberAddr(rs.getString(4));
				dto.setMemberPhone(rs.getString(5));
				dto.setMemberPower(rs.getInt(6));
				
				return dto;
			} else {
				// 아이디가 없을 경우 
				dto = new MemberDTO();
				dto.setMemberId("noid");
				return dto;
			}
		}catch (Exception e){
				e.printStackTrace();
			}
		return null;
	}
	
	
	public int delete(int CompeID){
		String SQL  = "DELETE Compeshedule SET CompeAvailable = 0 WHERE CompeID =?";
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, CompeID);
			return pstmt.executeUpdate();
		}catch (Exception e){
				e.printStackTrace();
			}
		return -1;
	}
}
