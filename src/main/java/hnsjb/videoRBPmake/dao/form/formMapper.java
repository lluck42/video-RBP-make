package hnsjb.videoRBPmake.dao.form;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface formMapper {
    
    @Insert("insert into form(name,description,files,status) values(#{name},#{description},#{files},#{status})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(form one);

    @Select("SELECT * FROM form WHERE id = #{id} limit 1")
    form first(@Param("id") int id);

    @Delete("delete from form where id = #{id}")
    int delete(form one);

    List<form> list(HashMap<String,Object>map);
    int count(HashMap<String,Object>map);

}
