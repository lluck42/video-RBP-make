package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class form {
    public int id;
    public int admin_id;
    public String admin_name;
    public String name;
    public String description;
    public String files;
    public String files_origin;
    public String status;
    public String created_at;
    public String updated_at;
}
