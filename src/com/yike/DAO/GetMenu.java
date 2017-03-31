package com.yike.DAO;

import java.util.ArrayList;
import java.util.List;

public class GetMenu {
	public AccMenu getaccmenu(List<AccBase> contents, boolean ispbx){
		List<AccFSW> accfsws = new ArrayList<AccFSW>();
		List<AccBase> tmp = new ArrayList<AccBase>();
		String level0 = "1";
		String level1 = "2";
		if(ispbx){
			level0 = "3";
			level1 = "4";
		}
			
		for(AccBase ab : contents){
			if(ab.getLevel().equals(level0)){
				accfsws.add(new AccFSW(ab,new ArrayList<AccBase>()));
			}else if(ab.getLevel().equals(level1)){
				tmp.add(ab);
			}
		}
		boolean istmp = true;
		for(AccFSW af : accfsws){
			if(istmp){
				for(AccBase ab : tmp){
					if(ab.getGroup().equals(af.getAccordion().getAccordion_id())){
						af.getAccordions().add(ab);
						contents.remove(ab);
					}
				}
				istmp = false;
			}else{
				for(AccBase ab : contents){
					if(ab.getGroup().equals(af.getAccordion().getAccordion_id())){
						af.getAccordions().add(ab);
						tmp.remove(ab);
					}
				}
				istmp = true;
			}
			
		}
		return new AccMenu("true", accfsws, null);
	}
	
	public AccMenuM getaccmenuall(List<AccBase> contents,boolean ispbx){
		int menucount = 0;
		List<AccBase> rootmenus = new ArrayList<AccBase>();
		List<AccBase> secmenus = new ArrayList<AccBase>();
		String level0 = "1";
		String level1 = "2";
		if(ispbx){
			level0 = "3";
			level1 = "4";
		}
		for(AccBase ab : contents){
			if(ab.getLevel().equals(level0)){
				int id = Integer.parseInt(ab.getIndex());
				ab.setId(ispbx?id-2:id);
				ab.setIconCls("icon-mini-add");
				if(ispbx)
					ab.setLevel("1");
				//ab.setState("closed");
				rootmenus.add(ab);
				menucount++;
			}else if(ab.getLevel().equals(level1)){
				ab.setIconCls("icon-mini-edit");
				if(ispbx)
					ab.setLevel("2");
				secmenus.add(ab);
				menucount++;
			}
		}
		for(AccBase ab : secmenus){
			for(AccBase abt : rootmenus){
				if(ab.getGroup().equals(abt.getAccordion_id())){
					//ab.setId(Integer.parseInt(abt.getIndex()+ab.getIndex()));
					ab.set_parentId(abt.getAccordion_id());
					abt.setState("closed");
				}
			}
		}
		return new AccMenuM(menucount, contents, "");
	}
}
