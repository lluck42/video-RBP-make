package hnsjb.videoRBPmake.dao.admin;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface permissionMapper {
    @Select("SELECT * FROM admin_permission WHERE admin_role = #{admin_role} and request_uri = #{request_uri} limit 1")
    permission check(@Param("admin_role") String admin_role, @Param("request_uri") String request_uri);
}
