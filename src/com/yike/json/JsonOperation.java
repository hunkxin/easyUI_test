package com.yike.json;

import java.util.List;

import com.yike.DAO.DbOperation;
import com.yike.DAO.GetMenu;
import com.yike.DAO.AccBase;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonOperation {
	public String tojson(String datatype,boolean ispbx){
		ObjectMapper mapper = new ObjectMapper();
       //JsonGenerator generator = mapper.getJsonFactory().createJsonGenerator(System.out,JsonEncoding.UTF8);
		DbOperation op = new DbOperation();
		try {
			if(datatype.equals("manager")){
				List<AccBase> contents = op.getdbcontent(ispbx,true);
				//System.out.println(mapper.writeValueAsString(contents));
				//System.out.println(mapper.writeValueAsString(new GetMenu().getaccmenuall(contents, ispbx)));
				return mapper.writeValueAsString(new GetMenu().getaccmenuall(contents, ispbx));
			}else if(datatype.equals("accmenu")){
				List<AccBase> contents = op.getdbcontent(ispbx,false);
				//System.out.println(mapper.writeValueAsString(confids));
				return mapper.writeValueAsString(new GetMenu().getaccmenu(contents,ispbx));
			}
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"success\":\"false\"}";
		}
		return "{\"success\":\"false\"}";
//       for(Dbcontent content:contents){
//          try {
//        	  //generator.writeObject(person);
//        	  //mapper.writeValue(System.out, content);
//        	  System.out.println(mapper.writeValueAsString(content)); 
//          } catch (JsonGenerationException e) {
//        	  // TODO Auto-generated catch block
//        	  e.printStackTrace();
//        	  System.out.println(e);
//          } catch (JsonMappingException e) {
//        	  // TODO Auto-generated catch block
//        	  e.printStackTrace();
//        	  System.out.println(e);
//          } catch (IOException e) {
//        	  // TODO Auto-generated catch block
//        	  e.printStackTrace();
//        	  System.out.println(e);
//           }
//          System.out.println("----------------"); 
//       }
	}
	
	public String tojsontext(AccBase content,String isupdate) throws JsonProcessingException{
		//ObjectMapper mapper = new ObjectMapper();
		DbOperation op = new DbOperation();
		if(isupdate.equals("false")){
			return op.insertdb(content)?"{\"success\":true}":"{\"success\":false}";
		}		
		else
			return op.updatedb(content)?"{\"success\":true}":"{\"success\":false}";
	}
	
	public String tojsontext(List<String> menu_ids){
		if(menu_ids.size()<1){
			return "{\"success\":false}";
		}
		DbOperation op = new DbOperation();
		return op.deletedb(menu_ids)?"{\"success\":true}":"{\"success\":false}";
	}
}
