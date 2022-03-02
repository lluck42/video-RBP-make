package hnsjb.videoRBPmake.dao.admin;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface adminMapper {
    @Select("SELECT * FROM admin WHERE id = #{id}")
    admin findById(@Param("id") int id);

    int update(@Param("id") admin test);

    List<admin> list(Map<String,Object>map);
    int count(Map<String,Object>map);

    @Select("SELECT id,name,token FROM admin WHERE name = #{name} and password = #{password}")
    admin login(@Param("name") String name, @Param("password") String password);
}
