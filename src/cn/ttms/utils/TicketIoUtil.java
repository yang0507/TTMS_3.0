package cn.ttms.utils;

import java.io.FileWriter;
import java.io.IOException;

import cn.ttms.pojo.Schedule;

public class TicketIoUtil {
	public static FileWriter  writer = null;
	
	public static void send(int row,int col,int ticket_id,Schedule schedule,String emp_no) {
		
		
		StringBuffer ticketBuffer = new StringBuffer();
		ticketBuffer.append("售票人编号："+emp_no+"\r\n");
		ticketBuffer.append("票号："+ticket_id+"\r\n");
		ticketBuffer.append("票价："+schedule.getSched_ticket_price()+"元\r\n");
		ticketBuffer.append("演出计划编号："+schedule.getSched_id()+"\r\n");
		ticketBuffer.append("剧目名称："+schedule.getPlay().getPlay_name()+"\r\n");
		ticketBuffer.append("剧目时长："+schedule.getPlay().getPlay_length()+"分钟\r\n");
		ticketBuffer.append("演出厅名称："+schedule.getStudio().getStudio_name()+"\r\n");
		ticketBuffer.append("座位所在行：第"+row+"行\r\n");
		ticketBuffer.append("座位所在列：第"+col+"列\r\n");
		ticketBuffer.append("座位编号："+row*col+"号\r\n");
		ticketBuffer.append("感谢您选择光线国际影院，预祝您观影愉快！");
		
		if(ticketBuffer!=null) {
			try {
				writer = new FileWriter("E:\\ttmsTicket\\"+ticket_id+".txt");
				writer.write("您的票信息：\r\n"+ticketBuffer);
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					writer.flush();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					writer.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		System.out.println(ticketBuffer);
	} 
}
