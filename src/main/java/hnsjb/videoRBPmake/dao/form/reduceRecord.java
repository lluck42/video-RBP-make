package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class reduceRecord {
    public int id;
    public int company_id;
    public String company_name;
    public int form_id;
    public String form_name;
    public String description;
    public String created_at;
}
