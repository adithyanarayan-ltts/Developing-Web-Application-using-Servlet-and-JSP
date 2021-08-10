package com.ltts.productionproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ltts.productionproject.configure.MyConfigure;
import com.ltts.productionproject.model.Member;

public class MemberDao {

	public boolean insertMember(Member m) throws Exception{
		Connection c = MyConfigure.getConnection();
		Statement s = c.createStatement();
		try{
			int count = s.executeUpdate("insert into members values("+null+", '"+m.getName()+"', '"+m.getPassword()+"', '"+m.getEmail()+"', '"+m.getLocation()+"')");
			System.out.println("Rows affected:"+count);
			return true;
		}catch(Exception e) {
			System.out.println(e);
			return false;
		}
		finally {
			c.close();
		}
	}
	public Member checkMember(String email, String pass) throws Exception{
		Connection c = MyConfigure.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from members where email like '"+email+"'");
		ResultSet rs = ps.executeQuery();
		rs.next();
		Member m = new Member(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
		c.close();
		return m;	
	}
}
