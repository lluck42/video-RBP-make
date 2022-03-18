package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class dialog {
    public int id;
    public int form_id;
    public int admin_id;
    public String admin_name;
    public String msg;
    public String created_at;
}
