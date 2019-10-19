package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.domain.AttrAndVal;

public interface AttrAndValMapper {

	List<AttrAndVal> findByScId(@Param("id") Integer cid);
	int addSecondValue(@Param("sid") Integer sid, @Param("value") String value);
	int add(@Param("list")List<AttrAndVal> list);
	int update(@Param("list")List<AttrAndVal> list);
	int delete(@Param("list")List<AttrAndVal> list);
	AttrAndVal check(@Param("skid") Integer skid, @Param("pkid") Integer pkid);
	List<AttrAndVal> findByProductId(@Param("pid") Integer pid);
	/*List<AttrAndVal> findByCatalogId(@Param("ckid") Integer ckid);*/
}
