package hnsjb.videoRBPmake.dao.upload;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface uploadMapper {

    @Insert("insert into upload(name,src,type,form_id,form_name,form_description) values(#{name},#{src},#{type},#{form_id},#{form_name},#{form_description})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(upload one);

    @Select("SELECT * FROM upload WHERE id = #{id} limit 1")
    upload first(@Param("token") String token);

    @Delete("delete from upload where id = #{id}")
    int delete(upload one);
}   
