package Competition;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CompetitionDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	
	public CompetitionDAO(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_b","root","1234");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	public String getDate(){ //����ð���������
		String SQL = "SELECT NOW()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1); //���� ��¥ ��ȯ
			} 
		}catch (Exception e){
				e.printStackTrace();
			}
		return ""; //db ����
		}
	
	
	
	
	public int getNext(){ 
		String SQL = "SELECT CompeID FROM Compeshedule ORDER BY CompeID DESC";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) + 1;
			}  
			return 1; //ù ��° �Խù��� ���
		}catch (Exception e){
				e.printStackTrace();
			}
		return -1; //db ����
		}
	
	
	
	public int write (String CompeTitle, String CompeID, String CompeContent){
		String SQL  = "INSERT INTO Compeshedule VALUES(?,?,?,?,?,?)";
		
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, CompeTitle);
			pstmt.setString(3, CompeID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, CompeContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e){
				e.printStackTrace();
			}
		return -1; //db ����
	}
	
	
	
	public ArrayList<Competition> getList(int pageNumber){
		String SQL = "SELECT * FROM Compeshedule WHERE CompeID < ? AND CompeAvailable = 1 ORDER BY CompeID DESC LIMIT 10 ";
		ArrayList<Competition> list = new ArrayList<Competition>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1 )*10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Competition compe = new Competition();
				compe.setCompeNum(rs.getInt(1));
				compe.setCompeTitle(rs.getString(2));
				//compe.setUserID(rs.getString(3));
				compe.setCompeDate(rs.getString(4));
				compe.setCompeContent(rs.getString(5));
				compe.setCompeAvailable(rs.getInt(6));
				
				list.add(compe);
				
			}  
		}catch (Exception e){
				e.printStackTrace();
			}
		return list;
	}
	
	
	public boolean nextPage(int pageNumber){
		
		String SQL = "SELECT * FROM Compeshedule WHERE CompeID < ? AND CompeAvailable = 1 ORDER BY CompeID DESC LIMIT 10 ";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1 )*10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
				
			}  
		}catch (Exception e){
				e.printStackTrace();
			}
		return false;
	}
	
	
	
	public Competition getCompetition(int CompeID){
		String SQL = "SELECT * FROM Compeshedule WHERE CompeID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, CompeID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Competition compe = new Competition();
				compe.setCompeNum(rs.getInt(1));
				compe.setCompeTitle(rs.getString(2));
				//compe.setUserID(rs.getString(3));
				compe.setCompeDate(rs.getString(4));
				compe.setCompeContent(rs.getString(5));
				compe.setCompeAvailable(rs.getInt(6));
				return compe;
				
			}  
		}catch (Exception e){
				e.printStackTrace();
			}
		return null;
	}
	
	
	
	public int update (int CompeID, String CompeTitle, String CompeContent){
String SQL  = "UPDATE Compeshedule SET CompeTitle = ?, CompeContent = ? WHERE CompeID =?";
		
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, CompeTitle);
			pstmt.setString(2, CompeContent);
			pstmt.setInt(3, CompeID);
			return pstmt.executeUpdate();
		}catch (Exception e){
				e.printStackTrace();
			}
		return -1; //db ����
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
		return -1; //db ����
	}
}
