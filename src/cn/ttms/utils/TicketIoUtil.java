package cn.ttms.utils;

import java.io.FileWriter;
import java.io.IOException;

import cn.ttms.pojo.Schedule;

public class TicketIoUtil {
	public static FileWriter  writer = null;
	
	public static void send(int row,int col,int ticket_id,Schedule schedule,String emp_no) {
		
		
		StringBuffer ticketBuffer = new StringBuffer();
		ticketBuffer.append("��Ʊ�˱�ţ�"+emp_no+"\r\n");
		ticketBuffer.append("Ʊ�ţ�"+ticket_id+"\r\n");
		ticketBuffer.append("Ʊ�ۣ�"+schedule.getSched_ticket_price()+"Ԫ\r\n");
		ticketBuffer.append("�ݳ��ƻ���ţ�"+schedule.getSched_id()+"\r\n");
		ticketBuffer.append("��Ŀ���ƣ�"+schedule.getPlay().getPlay_name()+"\r\n");
		ticketBuffer.append("��Ŀʱ����"+schedule.getPlay().getPlay_length()+"����\r\n");
		ticketBuffer.append("�ݳ������ƣ�"+schedule.getStudio().getStudio_name()+"\r\n");
		ticketBuffer.append("��λ�����У���"+row+"��\r\n");
		ticketBuffer.append("��λ�����У���"+col+"��\r\n");
		ticketBuffer.append("��λ��ţ�"+row*col+"��\r\n");
		ticketBuffer.append("��л��ѡ����߹���ӰԺ��Ԥף����Ӱ��죡");
		
		if(ticketBuffer!=null) {
			try {
				writer = new FileWriter("E:\\ttmsTicket\\"+ticket_id+".txt");
				writer.write("����Ʊ��Ϣ��\r\n"+ticketBuffer);
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
