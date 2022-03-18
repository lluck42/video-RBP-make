package hnsjb.videoRBPmake.dao.form;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface dialogMapper {
    
    @Insert("insert into form_dialog(form_id,admin_id,admin_name,msg) values(#{form_id},#{admin_id},#{admin_name},#{msg})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(dialog one);

    @Select("SELECT * FROM form_dialog WHERE id = #{id} limit 1")
    dialog first(@Param("id") int id);

    @Delete("delete from form_dialog where id = #{id}")
    int delete(dialog one);

    @Select("SELECT * FROM form_dialog WHERE form_id = #{form_id} order by id asc")
    List<dialog> oneFormList(@Param("form_id") int form_id);
}
