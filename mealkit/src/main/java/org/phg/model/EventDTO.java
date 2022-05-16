package org.phg.model;

public class EventDTO {
	private int event_no;
	private String event_title;
	private String event_start;
	private String event_end;
	
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	
	
	@Override
	public String toString() {
		return "EventDTO [event_no=" + event_no + ", event_title=" + event_title + ", event_start=" + event_start
				+ ", event_end=" + event_end + "]";
	}
	
}
