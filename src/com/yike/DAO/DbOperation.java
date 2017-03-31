package com.yike.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DbOperation {
	
	public DbOperation() {
		
	}

	public List<AccBase> getdbcontent(boolean ispbx,boolean isall){
		List<AccBase> contents = new ArrayList<AccBase>();
		Connection con = new JDBCMysql().getconnect();
		Statement stmt = null;
		ResultSet res = null;
		try {
			stmt = con.createStatement();
			String sqlcmd;
			if(ispbx){
				if(isall)
					sqlcmd = "select * from `acc_content` where `level`>2 order by `level`,`index`,`group`";
				else
					sqlcmd = "select * from `acc_content` where `status`=1 and `level`>2 order by `level`,`index`,`group`";
			}
			else{
				if(isall)
					//sqlcmd = "select * from `acc_content` where `group`='"+group+"' order by `level`,`index`";
					sqlcmd = "select * from `acc_content` where `level`<3 order by `level`,`index`,`group`";
				else
					sqlcmd = "select * from `acc_content` where `status`=1 and `level`<3 order by `level`,`index`,`group`";
			}	
			//System.out.println(sqlcmd);
//			if(sql.executeQuery(sqlcmd)){
//				
//			}
			res = stmt.executeQuery(sqlcmd);
			//int i=0;
			while(res.next())
			{
				AccBase content = new AccBase(res.getString("level"),
											  res.getString("index"),
											  res.getString("accordion_id"),
											  res.getString("group"),
											  res.getString("accordion_name"),
											  res.getString("icon"), 
											  res.getString("system_module"), 
											  res.getString("url"),
											  res.getString("status"),
											  res.getString("lastmodifier"),
											  res.getString("creator"),
											  res.getString("create_time"),
											  res.getString("modify_time"),
											  0,"","",null);
				//i++;
				contents.add(content);
			}
			//System.out.println(i);
//			res.close();
//			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sorry,there are some problems when connect to database!");
			contents = null;
		}finally{
			if (res != null) {
		        try {
		        	res.close();
		        } catch (SQLException sqlEx) { } // ignore

		        res = null;
		    }

		    if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException sqlEx) { } // ignore

		        stmt = null;
		    }
		}
		
		return contents;
	}
	
	public Boolean insertdb(AccBase content){
		Connection con = new JDBCMysql().getconnect();
		Statement stmt = null;
		//ResultSet res = null;
		Boolean isok = true;
		try {
			stmt = con.createStatement();
			
			String sqlcmd = "UPDATE `acc_content` SET "
					+"`index` = `index`+1 ,"
					+"`modify_time` = NOW() "
					+ "WHERE `group` = '"+content.getGroup()+
					"' and `level` = "+content.getLevel()+
					" and `index` >= "+content.getIndex();
			//stmt.executeUpdate(sqlcmd);
			stmt.addBatch(sqlcmd);
			
			sqlcmd = "INSERT INTO `acc_content`(`level`,`index`,`accordion_id`,`group`,`accordion_name`,`icon`,`system_module`,`url`,`status`, `lastmodifier`,`creator`,`create_time`) select "
					+content.getLevel()+","
					+content.getIndex()+","
					+"UUID(),'"
					+content.getGroup()+"','"
					+content.getAccordion_name()+"','"
					+content.getIcon()+"','"
					//+content.getIconCls()+"','"
					+content.getSystem_module()+"','"
					+content.getUrl()+"',"
					+content.getStatus()+",'"
					+content.getLastmodifier()+"','"
					+content.getCreator()+"',"
					+"NOW()"
					+" from dual where exists(select * from `acc_content` where "
					+(("").equals(content.getGroup())?("`group` = '')"):("`accordion_id` = '"+content.getGroup()+"')"));
			System.out.println(sqlcmd);
			//stmt.executeUpdate(sqlcmd);
			
			stmt.addBatch(sqlcmd);
			stmt.executeBatch();
			
//			sqlcmd = "select * from `acc_content` where `level`="+content.getLevel()+
//					" and `index`="+content.getIndex()+
//					" and `group`='"+content.getGroup()+
//					"' and `accordion_name`='"+content.getAccordion_name()+"'";
//			res = stmt.executeQuery(sqlcmd);
//			//int i=0;
//			AccBase newcontent = null;
//			
//			while(res.next())
//			{
//				newcontent = new AccBase(res.getString("level"),
//											  res.getString("index"),
//											  res.getString("accordion_id"),
//											  res.getString("group"),
//											  res.getString("accordion_name"),
//											  res.getString("icon"), 
//											  res.getString("system_module"), 
//											  res.getString("url"),
//											  res.getString("status"),
//											  res.getString("lastmodifier"),
//											  res.getString("creator"),
//											  res.getString("create_time"),
//											  res.getString("modify_time"),
//											  0,"","");
//				//i++;
//			}
//			return new AccSMenu(true,newcontent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sorry,there are some problems when connect to database!");
			isok = false;
		}finally{
		    if (stmt != null) {
		        try {
		        	stmt.clearBatch();
		            stmt.close();
		        } catch (SQLException sqlEx) { } // ignore

		        stmt = null;
		    }
		}
		//return new AccSMenu(false,null);
		return isok;
	}
	
	public boolean updatedb(AccBase content){
		boolean isok = true;
		Connection con = new JDBCMysql().getconnect();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			String sqlcmd = "UPDATE `acc_content` SET "
					+"`level` = "+content.getLevel()+","
					+"`index` = "+content.getIndex()+","
					+"`group` = '"+content.getGroup()+"',"
					+"`accordion_name` = '"+content.getAccordion_name()+"',"
					+"`icon` = '"+content.getIcon()+"',"
					+"`system_module` = '"+content.getSystem_module()+"',"
					+"`url` = '"+content.getUrl()+"',"
					+"`status` = "+content.getStatus()+","
					+"`lastmodifier` = '"+content.getLastmodifier()+"',"
					+"`creator` = '"+content.getCreator()+"',"
					+"`modify_time` = NOW() "
					+ "WHERE `accordion_id` = '"+content.getAccordion_id()+"'";
			//System.out.println(sqlcmd);
			stmt.executeUpdate(sqlcmd);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sorry,there are some problems when connect to database!");
			isok=false;
		}finally{
			if (stmt != null) {
		        try {
		            stmt.close();
		        } catch (SQLException sqlEx) { } // ignore

		        stmt = null;
		    }
		}
		return isok;
	}
	
	public boolean deletedb(List<String> menu_ids){
		boolean isok = true;
		Connection con = new JDBCMysql().getconnect();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			for(int i=0;i < (menu_ids.size()/2); i++){
				String sqlcmd = "UPDATE `acc_content` SET "
						+"`index` = `index`-1 ,"
						+"`modify_time` = NOW() "
						+ "WHERE `group` = '"+menu_ids.get(2*i+1)+
						"' and `index` > (select ub.index from "
						+"(select ua.index from acc_content ua where ua.accordion_id = '"
						+menu_ids.get(2*i)+"') ub)";
				System.out.println(sqlcmd);
				stmt.addBatch(sqlcmd);
				sqlcmd = "DELETE FROM `acc_content` WHERE `accordion_id` = '"+menu_ids.get(2*i)+"' OR `group` = '"+menu_ids.get(2*i)+"'";
				stmt.addBatch(sqlcmd);
				stmt.executeBatch();
			}
			//stmt.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("sorry,there are some problems when connect to database!");
			isok=false;
		}finally{
			if (stmt != null) {
		        try {
		        	stmt.clearBatch();
		            stmt.close();
		        } catch (SQLException sqlEx) { } // ignore

		        stmt = null;
		    }
		}
		return isok;
	}
	
}
