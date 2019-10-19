package cn.lingnan.webshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.AttrAndValMapper;
import cn.lingnan.webshop.domain.AttrAndVal;
import cn.lingnan.webshop.service.AttrAndValService;

@Service
public class AttrAndValServiceImpl implements AttrAndValService {
	
	@Autowired
	AttrAndValMapper aMapper;

	@Override
	public PageInfo<AttrAndVal> getSecondValue(Integer id) {
		PageHelper.startPage(1, 10);
		Page<AttrAndVal> list = (Page<AttrAndVal>) aMapper.findByScId(id);
		return list.toPageInfo();
	}

	@Override
	public boolean addSecondValue(Integer sid, String value) {
		if (aMapper.addSecondValue(sid, value) > 0) {
			return true;
		}
		return false;
	}

	//========================20190509============================
	@Override
	public boolean add(List<AttrAndVal> ls) {
		if (aMapper.add(ls) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(List<AttrAndVal> ls) {
		if (aMapper.update(ls) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public AttrAndVal check(Integer skid, Integer pkid) {
		return aMapper.check(skid, pkid);
	}

	@Override
	public List<AttrAndVal> findByProductId(Integer pid) {
		return aMapper.findByProductId(pid);
	}

	@Override
	public boolean delete(List<AttrAndVal> ls) {
		if (aMapper.delete(ls) > 0) {
			return true;
		}
		return false;
	}

	/*@Override
	public List<AttrAndVal> findByCatalogId(Integer ckid) {
		return aMapper.findByCatalogId(ckid);
	}*/
	
}
