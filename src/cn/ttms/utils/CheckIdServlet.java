package cn.ttms.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckIdServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		char[] array = new char[4];
		int width = 120;
		int height = 30;
		BufferedImage bd = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D g = (Graphics2D) bd.getGraphics();
		g.setColor(Color.BLACK);
		int x = 0;
		int y = 0;
		g.fillRect(x, y, width, height);
		g.setColor(Color.WHITE);
		g.drawRect(x, y, width - 1, height - 1);
		g.setFont(new Font("����", Font.BOLD, 20));
		String st = "0123456789";
		//String st = "ABCDEFGHIGKLMNOPQRSTUVWXYZabcdefghigklmnopqrstuvwxyz0123456789������˹����֪ʶ�ڵķ�����ٹ������ǵ¹��żٻص���ȴ��ȫ��ζ�����Բ�˧��";
		// String st="��ɵ�ϺͰ�����˹����֪ʶ�ڵķ�����ٹ������ǵ¹��żٻص���ȴ��ȫ��ζ�����Բ�˧�翴���˾Ϳ��Ǻ���";
		g.setColor(Color.RED);
		int j = 20, k = 20;
		Random r = new Random();
		for (int i = 0; i < 4; i++) {
			// ��ת ����=�Ƕ�*math.pi/180
			int jiaodu = r.nextInt(60) - 30;
			g.rotate(jiaodu * Math.PI / 180, j, k);
			int index = r.nextInt(st.length());
			char ch =st.charAt(index);
			g.drawString(ch + "", j, k);
			g.rotate(-jiaodu * Math.PI / 180, j, k);
			j += 20;
			array[i]=ch;
		}
		String str = new String(array); 
		System.out.println(str + "��֤��ֵ1");
		g.setColor(Color.YELLOW);
		int x1, x2, y1, y2;
		for (int i = 0; i < 4; i++) {
			x1 = r.nextInt(width);
			x2 = r.nextInt(width);
			y1 = r.nextInt(height);
			y2 = r.nextInt(height);
			g.drawLine(x1, y1, x2, y2);
		}
//		System.out.println(a);
		ImageIO.write(bd, "jpg", response.getOutputStream());
		
//	
//		ServletContext sc=this.getServletContext();
//		
//		sc.setAttribute("3", "resp.getOutputStream()");
		
		//�Ƚ�
		ServletContext check=this.getServletContext();
		check.setAttribute("cleckvalue",str);
//        String value = (String) check.getAttribute("cleckvalue"); 
//        System.out.println(value);
		System.out.println(str + "��֤��ֵ2");
//		String checkvalue = request.getParameter("checkvalue");
//		System.out.println(checkvalue + "��ҳ���ϻ�ȡֵ");
//        ServletContext context = this.getServletContext();
        //��ȡ������������  
//      String value = (String)context.getInitParameter("cleckvalue"); 
//		System.out.println(value + "��ӵ�ȫ�ֱ������ֵ");
//        if(checkvalue.equals(value)) {
//			response.sendRedirect("./success.html"); //�ض����ַ 	���װ�
//			System.out.println("�ɹ�");
//		}else {
//			response.sendRedirect("./success.html"); //�ض����ַ 	���װ�
//			response.sendRedirect("./error.html");
//			System.out.println("ʧ��");
//		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
