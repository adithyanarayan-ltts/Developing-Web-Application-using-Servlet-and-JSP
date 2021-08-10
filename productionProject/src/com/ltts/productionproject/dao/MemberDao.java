package com.ltts.productionproject.dao;

import java.sql.Connection;
import java.sql.Statement;

import com.ltts.productionproject.configure.MyConfigure;
import com.ltts.productionproject.model.Member;

public class MemberDao {

	public boolean insertMember(Member m) throws Exception{
		Connection c = MyConfigure.getConnection();
		Statement s = c.createStatement();
		try{
			int count = s.executeUpdate("insert into member values('"+m.getName()+"', '"+m.getPassword()+"', '"+m.getEmail()+"', '"+m.getLocation()+"')");
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
}
