package meeting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class MeetingDAO {
	private Connection conn;
	private ResultSet rs;
	
	public MeetingDAO() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_b", "root", "1234");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate(){
		String SQL = "SELECT NOW()";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
	}
	
	public int getNext(){
		String SQL = "SELECT meetingID FROM meeting ORDER BY meetingID DESC";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1)+1;
			}
			return 1; // 첫 번째 게시물인 경우
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String meetingTitle,String userID,String meetingContent){
		String SQL = "INSERT INTO meeting VALUES(?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,meetingTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4,getDate());
			pstmt.setString(5,meetingContent);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Meeting> getList(int pageNumber){
		String SQL = "SELECT * FROM meeting WHERE meetingID < ? AND meetingAvailable = 1 "
				+ "   ORDER BY meetingID DESC LIMIT 10";
		ArrayList<Meeting> list = new ArrayList<Meeting>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Meeting meeting =  new Meeting();
				meeting.setMeetingID(rs.getInt(1));
				meeting.setMeetingTitle(rs.getString(2));
				meeting.setUserID(rs.getString(3));
				meeting.setMeetingDate(rs.getString(4));
				meeting.setMeetingContent(rs.getString(5));
				meeting.setMeetingAvailable(rs.getInt(6));
				list.add(meeting);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM meeting WHERE meetingID < ? AND meetingAvailable = 1 ";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false; 
		
	}
	
	public Meeting getMeeting(int meetingID){
		String SQL = "SELECT * FROM meeting WHERE meetingID =?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, meetingID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Meeting meeting =  new Meeting();
				meeting.setMeetingID(rs.getInt(1));
				meeting.setMeetingTitle(rs.getString(2));
				meeting.setUserID(rs.getString(3));
				meeting.setMeetingDate(rs.getString(4));
				meeting.setMeetingContent(rs.getString(5));
				meeting.setMeetingAvailable(rs.getInt(6));
				return meeting;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null; 
	
	}
	public int update(int meetingID,String meetingTitle,String meetingContent){
		String SQL = "UPDATE meeting SET meetingTitle = ?, meetingContent =? WHERE meetingID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,meetingTitle);
			pstmt.setString(2,meetingContent);
			pstmt.setInt(3,meetingID);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int meetingID){
		String SQL = "UPDATE meeting SET meetingAvailable = 0 WHERE meetingID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,meetingID);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete1(){
		String SQL = "DELETE FROM meeting WHERE meetingAvailable =0";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}

