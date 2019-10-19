package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.domain.SecondCatalog;

public interface SecondCatalogMapper {
	List<SecondCatalog> findById(@Param("id") Integer id);
	int updateCategories(@Param("cid") Integer cid, @Param("sid") Integer sid, @Param("attrid") Integer attrid, @Param("value") String value);
	int addSecondCatalog(@Param("cid") Integer cid, @Param("value") String value);
}
