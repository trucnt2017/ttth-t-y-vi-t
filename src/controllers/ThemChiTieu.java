package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.CallableStatement;

@WebServlet("/ThemChiTieu")
public class ThemChiTieu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;   

    public ThemChiTieu() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mc = request.getParameter("namemaChi");
		String ndc = request.getParameter("namenoiDungChi");
		String nc = request.getParameter("namengayChi");
		Float gt = Float.parseFloat(request.getParameter("namegiaTien"));
		String mnv = request.getParameter("namemaNV");
		String update=request.getParameter("chiTieuUpdate");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			
			if(update.contains("true"))
			{
				//System.out.println("update " + update);
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatChiTieu(?,?,?,?,?)}");
				cst.setString(1,  mc);
				cst.setString(2,  ndc);
				cst.setString(3,  nc);
				cst.setFloat(4, gt);
				cst.setString(5, mnv);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyChiTieu");
				
				
			}else
			{
				//System.out.println(update);
				conn = dataAccess.DBConnector.getConnection();
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemChiTieu(?,?,?,?,?)}");
				cst.setString(1,  mc);
				cst.setString(2,  ndc);
				cst.setString(3,  nc);
				cst.setFloat(4, gt);
				cst.setString(5, mnv);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyChiTieu");
				
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
