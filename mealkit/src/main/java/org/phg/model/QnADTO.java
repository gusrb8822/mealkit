package org.phg.model;

public class QnADTO {
	private int qna_no;
	private String question;
	private String answer;
	private String qna_group;
	
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQna_group() {
		return qna_group;
	}
	public void setQna_group(String qna_group) {
		this.qna_group = qna_group;
	}
	
	
	@Override
	public String toString() {
		return "QnADTO [qna_no=" + qna_no + ", question=" + question + ", answer=" + answer + ", qna_group=" + qna_group
				+ "]";
	}
	
}
