package hnsjb.videoRBPmake.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface adminMapper {

    @Select("SELECT * FROM admin WHERE id = 1")
    admin hnsjb();

    @Select("SELECT * FROM admin WHERE id = #{id}")
    admin first(@Param("id") int id);

    @Select("SELECT * FROM admin WHERE name = #{name} or mobile = #{mobile} or email = #{email} limit 1")
    admin addUnique(admin one);

    @Insert("insert into admin(name,mobile,role,email,password,token) values(#{name},#{mobile},#{role},#{email},#{password},#{token})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(admin one);

    int update(@Param("id") admin test);

    List<admin> list(Map<String,Object>map);
    int count(Map<String,Object>map);

    @Select("SELECT * FROM admin WHERE name = #{name} and password = #{password} limit 1")
    admin nameLogin(@Param("name") String name, @Param("password") String password);

    @Select("SELECT * FROM admin WHERE mobile = #{mobile} and password = #{password} limit 1")
    admin mobileLogin(@Param("mobile") String mobile, @Param("password") String password);

    @Select("SELECT * FROM admin WHERE email = #{email} limit 1")
    admin emailLogin(@Param("email") String mobile);

    @Select("SELECT * FROM admin WHERE token = #{token} limit 1")
    admin info(@Param("token") String token);

    @Update("UPDATE admin SET token=#{token} where id=#{id}")
    int setToken(admin one);

    @Update("UPDATE admin SET password=#{password} where id=#{id}")
    int changePassword(admin one);

    @Update("UPDATE admin SET wx_unionid=#{wx_unionid} where id=#{id}")
    int wxBind(admin one);

    @Update("UPDATE admin SET wx_unionid=null where id=#{id}")
    int wxUnbind(admin one);
}
