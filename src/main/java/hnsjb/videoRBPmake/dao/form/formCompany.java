package hnsjb.videoRBPmake.dao.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class formCompany extends form {
    public company company;
}
