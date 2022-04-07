package hnsjb.videoRBPmake.dao.upload;

import java.sql.Date;

import lombok.Data;

@Data
public class upload {
    public int id;
    public String name;
    public String type;
    public String src;
    public int form_id;
    // public String form_name;
    // public String form_description;
    public Date created_at;
}
