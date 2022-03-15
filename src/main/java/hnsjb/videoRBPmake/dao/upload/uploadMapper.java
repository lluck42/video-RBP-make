package hnsjb.videoRBPmake.dao.upload;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface uploadMapper {

    @Insert("insert into upload(name,src,form_id,form_name,form_description) values(#{name},#{src},#{form_id},#{form_name},#{form_description})")
    int add(upload one);

    @Select("SELECT * FROM upload WHERE id = #{id} limit 1")
    upload first(@Param("token") String token);

    @Delete("delete from upload where id = #{id}")
    int delete(upload one);
}   
