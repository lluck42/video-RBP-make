package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class formCompany {
    public int id;
    public int admin_id;
    public String admin_name;
    public int company_id;
    public String company_name;
    public String is_shoot;
    public String is_clip;
    public String is_interview;
    public String name;
    public String description;
    public String link_man;
    public String link_mobile;
    public String files;
    public String files_origin;
    public String status;
    public String production_status;
    public String visit_date;
    public String expect_delivery_date;
    public String created_at;
    public String updated_at;
    public company company;
}
