package cn.ttms.pojo;

import java.sql.Timestamp;

public class Ticket {
	/*
	 *    'ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `seat_id` int(11) DEFAULT NULL,
		  `sched_id` int(11) DEFAULT NULL,
		  `ticket_price` decimal(10,2) DEFAULT NULL,
		  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\r\n            0：待�?售\r\n            1：锁定\r\n            9：卖�?',
		  `ticket_locked_time` datetime DEFAULT NULL,
		  PRIMARY KEY (`ticket_id`),
		  KEY `FK_sched_ticket` (`sched_id`),
		  KEY `FK_seat_ticket` (`seat_id`),
		  CONSTRAINT `FK_sched_ticket` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
		  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`)
	 */
	
	private int ticket_id;
	private int seat_id;
	private int sched_id;
	private double ticket_price;
	private int ticket_status;
	private Timestamp ticket_locked_time;
	private Seat seat;
	private Schedule schedule;
	public Ticket(){
		
	}
	public int getTicket_id() {
		return ticket_id;
	}
	public Ticket(int ticket_id, int seat_id, int sched_id, double ticket_price, short ticket_status,
			Timestamp ticket_locked_time) {
		super();
		this.ticket_id = ticket_id;
		this.seat_id = seat_id;
		this.sched_id = sched_id;
		this.ticket_price = ticket_price;
		this.ticket_status = ticket_status;
		this.ticket_locked_time = ticket_locked_time;
	}
	
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getSched_id() {
		return sched_id;
	}
	public void setSched_id(int sched_id) {
		this.sched_id = sched_id;
	}
	public double getTicket_price() {
		return ticket_price;
	}
	public int getTicket_status() {
		return ticket_status;
	}
	public void setTicket_status(int ticket_status) {
		this.ticket_status = ticket_status;
	}
	public void setTicket_price(double ticket_price) {
		this.ticket_price = ticket_price;
	}
	public Timestamp getTicket_locked_time() {
		return ticket_locked_time;
	}
	public void setTicket_locked_time(Timestamp ticket_locked_time) {
		this.ticket_locked_time = ticket_locked_time;
	}


}
