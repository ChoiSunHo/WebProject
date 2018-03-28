package meeting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardCommentDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardCommentDAO() {
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
		String SQL = "SELECT commentID FROM boardComment ORDER BY commentID DESC";
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
	public int commentwrite(String userID,String commentContent){
		String SQL = "INSERT INTO boardComment VALUES(?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,userID);
			pstmt.setString(3,commentContent);
			pstmt.setString(4,getDate());
			pstmt.setInt(5,1);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<BoardComment> getList(int pageNumber1){
		String SQL = "SELECT * FROM boardComment WHERE commentID < ? AND commentAvailable = 1 "
				+ "   ORDER BY commentID DESC LIMIT 5";
		ArrayList<BoardComment> list = new ArrayList<BoardComment>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber1-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardComment boardcomment =  new BoardComment();
				boardcomment.setCommentID(rs.getInt(1));
				boardcomment.setUserID(rs.getString(2));
				boardcomment.setCommentContent(rs.getString(3));
				boardcomment.setCommentDate(rs.getString(4));
				boardcomment.setCommentAvailable(rs.getInt(5));
				list.add(boardcomment);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list; 
	}
	public boolean nextPage(int pageNumber1){
		String SQL = "SELECT * FROM boardComment WHERE commentID < ? AND commentAvailable = 1 ";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber1-1)*5);
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
	public BoardComment getBoardComment(int commentID){
		String SQL = "SELECT * FROM boardComment WHERE commentID =?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				BoardComment boardcomment =  new BoardComment();
				boardcomment.setCommentID(rs.getInt(1));
				boardcomment.setUserID(rs.getString(2));
				boardcomment.setCommentContent(rs.getString(3));
				boardcomment.setCommentDate(rs.getString(4));
				boardcomment.setCommentAvailable(rs.getInt(5));
				return boardcomment;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null; 
	
	}
	
	public int delete(int commentID){
		String SQL = "UPDATE boardComment SET commentAvailable = 0 WHERE commentID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,commentID);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete1(){
		String SQL = "DELETE FROM boardComment WHERE commentAvailable =0";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
