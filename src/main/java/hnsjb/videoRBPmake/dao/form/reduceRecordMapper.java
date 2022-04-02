package hnsjb.videoRBPmake.dao.form;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface reduceRecordMapper {
    
    @Insert("insert into reduce_record(company_id,company_name,form_id,form_name,description) values(#{company_id},#{company_name},#{form_id},#{form_name},#{description})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(reduceRecord one);

}
