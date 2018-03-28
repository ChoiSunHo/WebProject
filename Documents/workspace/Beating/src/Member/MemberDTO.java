package Member;

public class MemberDTO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberAddr;
	private String memberPhone;
	private int memberPower;
	
	public MemberDTO(){
		
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberAddr=" + memberAddr + ", memberPhone=" + memberPhone + ", memberPower=" + memberPower + "]";
	}

	public MemberDTO(String memberId, String memberPw, String memberName, String memberAddr, String memberPhone, int memberPower){
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAddr = memberAddr;
		this.memberPhone = memberPhone;
		this.memberPower = memberPower;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public void setMemberPower(int memberPower) {
		this.memberPower = memberPower;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public int getMemberPower() {
		return memberPower;
	}
	
	
}
