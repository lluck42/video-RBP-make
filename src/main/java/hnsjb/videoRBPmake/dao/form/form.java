package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class form {
    public int id;
    public int admin_id;
    public String admin_name;
    public int company_id;
    public String scale;
    public String type;
    public String name;
    public String description;
    public String demand_file;
    public String link_man;
    public String link_mobile;
    public String link_email;
    public String files;
    public String files_origin;
    public String status;
    public String production_status;
    public String visit_date;
    public String expect_delivery_date;
    public String created_at;
    public String updated_at;
}
