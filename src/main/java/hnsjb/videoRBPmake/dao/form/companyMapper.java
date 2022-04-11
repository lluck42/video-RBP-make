package hnsjb.videoRBPmake.dao.form;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


@Mapper
public interface companyMapper {
    
    @Insert("insert into company(admin_id,name,address) values(#{admin_id},#{name},#{address})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(company one);

    @Select("SELECT * FROM company WHERE name = #{name} and admin_id = #{admin_id} limit 1")
    company findMyByName(company one);

    @Select("SELECT * FROM company WHERE id = #{id}")
    company first(@Param("id") int id);

    @Delete("delete from company where id = #{id}")
    int delete(company one);

    List<form> list(HashMap<String,Object>map);
    int count(HashMap<String,Object>map);

    @Update("UPDATE company SET shoot_num=shoot_num-1 where id=#{id}")
    int shootNumReduce1(@Param("id") int id);

    @Update("UPDATE company SET clip_num=clip_num-1 where id=#{id}")
    int clipNumReduce1(@Param("id") int id);

    @Update("UPDATE company SET interview_num=interview_num-1 where id=#{id}")
    int interviewNumReduce1(@Param("id") int id);

}
