package cn.ttms.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class Schedule {
	/*
	 * `sched_id` int(11) NOT NULL AUTO_INCREMENT,
		  `studio_id` int(11) DEFAULT NULL,
		  `play_id` int(11) DEFAULT NULL,
		  `sched_time` datetime NOT NULL,
		  `sched_ticket_price` decimal(10,2) DEFAULT NULL,
		  PRIMARY KEY (`sched_id`),
		  KEY `FK_play_sched` (`play_id`),
		  KEY `FK_studio_sched` (`studio_id`),
		  CONSTRAINT `FK_play_sched` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
		  CONSTRAINT `FK_studio_sched` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
	 */
	private int sched_id;
	private int studio_id;
	private int play_id;
	private Timestamp sched_time;
	private double sched_ticket_price;
	private int sched_status;
	private Studio studio;
	private Play play;
	public Schedule(){
		
	}
	public Schedule(int sched_id, int studio_id, int play_id, Timestamp sched_time, double sched_ticket_price) {
		super();
		this.sched_id = sched_id;
		this.studio_id = studio_id;
		this.play_id = play_id;
		this.sched_time = sched_time;
		this.sched_ticket_price = sched_ticket_price;
	}
	public int getSched_status() {
		return sched_status;
	}
	public void setSched_status(int sched_status) {
		this.sched_status = sched_status;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public Play getPlay() {
		return play;
	}
	public void setPlay(Play play) {
		this.play = play;
	}
	public int getSched_id() {
		return sched_id;
	}
	public void setSched_id(int sched_id) {
		this.sched_id = sched_id;
	}
	public int getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(int studio_id) {
		this.studio_id = studio_id;
	}
	public int getPlay_id() {
		return play_id;
	}
	public void setPlay_id(int play_id) {
		this.play_id = play_id;
	}
	public Timestamp getSched_time() {
		return sched_time;
	}
	public void setSched_time(Timestamp sched_time) {
		this.sched_time = sched_time;
	}
	public double getSched_ticket_price() {
		return sched_ticket_price;
	}
	public void setSched_ticket_price(double sched_ticket_price) {
		this.sched_ticket_price = sched_ticket_price;
	}
}
