package meeting;

public class Meeting {

	private int meetingID; //게시글 번호
	private String meetingTitle; //게시글 제목
	private String userID; //아이디
	private String meetingDate; // 게시글 날자
	private String  meetingContent; //게시글내용
	private int meetingAvailable; // 삭제 여부
	
	public int getMeetingID() {
		return meetingID;
	}
	public void setMeetingID(int meetingID) {
		this.meetingID = meetingID;
	}
	public String getMeetingTitle() {
		return meetingTitle;
	}
	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	public String getMeetingContent() {
		return meetingContent;
	}
	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}
	public int getMeetingAvailable() {
		return meetingAvailable;
	}
	public void setMeetingAvailable(int meetingAvailable) {
		this.meetingAvailable = meetingAvailable;
	}
	
	
}
