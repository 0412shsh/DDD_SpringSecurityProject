package com.ddd.domain;

import java.sql.Date;

public class DiaryBoardVO {

		private int dno;
		private String userid;
		private String title;
		private String content;
		private String score;
		private Date write_date;
		
		
		public int getDno() {
			return dno;
		}
		public void setDno(int dno) {
			this.dno = dno;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getScore() {
			return score;
		}
		public void setScore(String score) {
			this.score = score;
		}
		public Date getWrite_date() {
			return write_date;
		}
		public void setWrite_date(Date write_date) {
			this.write_date = write_date;
		}
		@Override
		public String toString() {
			return "DiaryBoardVO [dno=" + dno + ", userid=" + userid + ", title=" + title + ", content=" + content
					+ ", score=" + score + ", write_date=" + write_date + "]";
		}
		
		
		
		
		
}
