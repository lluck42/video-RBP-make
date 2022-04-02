package hnsjb.videoRBPmake.dao.form;

import lombok.Data;

@Data
public class company {
    public int id;
    public int admin_id;
    public String name;
    public String scale;
    public String address;
    public int shoot_num;
    public int clip_num;
    public int interview_num;
    public String created_at;
    public String updated_at;
}
