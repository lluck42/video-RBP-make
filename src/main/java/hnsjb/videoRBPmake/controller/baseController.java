package hnsjb.videoRBPmake.controller;

public class baseController {
    // 公共返回前端数据
    public Rtn rtn() {
        Rtn one = new baseController.Rtn();
        return one;
    }

    public Rtn rtn(int status, String msg, Object data) {
        Rtn one = new baseController.Rtn();
        one.status = status;
        one.msg = msg;
        one.data = data;
        return one;
    }

    public Rtn rtn(int status, String msg){
        Rtn one = new baseController.Rtn();
        one.status = status;
        one.msg = msg;
        return one;
    }

    public Rtn rtn(Object data){
        Rtn one = new baseController.Rtn();
        one.data = data;
        return one;
    }

    public Rtn rtn(String msg){
        Rtn one = new baseController.Rtn();
        one.msg = msg;
        return one;
    }

    public Rtn rtn(int status){
        Rtn one = new baseController.Rtn();
        one.status = status;
        return one;
    }

    public class Rtn{
        public int status = 1;
        public String msg = "请求成功";
        public Object data = null;
    }

}
