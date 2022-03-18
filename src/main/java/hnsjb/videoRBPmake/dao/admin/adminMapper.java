package hnsjb.videoRBPmake.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface adminMapper {

    @Select("SELECT * FROM admin WHERE id = #{id}")
    admin findById(@Param("id") int id);

    int update(@Param("id") admin test);

    List<admin> list(Map<String,Object>map);
    int count(Map<String,Object>map);

    @Select("SELECT * FROM admin WHERE name = #{name} and password = #{password}")
    admin nameLogin(@Param("name") String name, @Param("password") String password);

    @Select("SELECT * FROM admin WHERE mobile = #{mobile} and password = #{password}")
    admin mobileLogin(@Param("mobile") String mobile, @Param("password") String password);

    @Select("SELECT * FROM admin WHERE token = #{token}")
    admin info(@Param("token") String token);

    @Update("UPDATE admin SET token=#{token} where id=#{id}")
    int setToken(admin one);
}
