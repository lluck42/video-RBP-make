package hnsjb.videoRBPmake.dao.form;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


@Mapper
public interface formMapper {
    
    @Insert("insert into form(admin_id,admin_name,name,status) values(#{admin_id},#{admin_name},#{name},#{status})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(form one);

    @Update("UPDATE form SET name=#{name}, description=#{description}, link_man=#{link_man}, link_mobile=#{link_mobile}, files_origin=#{files_origin} where id=#{id}")
    int myUpdate(form one);

    @Select("SELECT * FROM form WHERE id = #{id}")
    form first(@Param("id") int id);

    @Delete("delete from form where id = #{id}")
    int delete(form one);


    @Update("UPDATE form SET status=#{status} where id=#{id}")
    int setStatus(form one);

    @Update("UPDATE form SET files=#{files} where id=#{id}")
    int setFiles(form one);

    @Update("UPDATE form SET files_origin=#{files_origin} where id=#{id}")
    int setFilesOrigin(form one);

    List<form> list(HashMap<String,Object>map);
    int count(HashMap<String,Object>map);

    @Select("SELECT count(*) FROM form WHERE company_id = #{company_id}")
    @ResultType(int.class)
    int oneCompanyCount(@Param("company_id") int company_id);

}
