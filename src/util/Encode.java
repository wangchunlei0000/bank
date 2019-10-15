package util;

public class Encode {
    public  static String  toChinese(String strvalue) {
           try {
               if (strvalue == null) {
                   return "";
               } else {
                   strvalue = new String(strvalue.getBytes("ISO-8859-1"), "UTF-8");
                   return strvalue;
               }
           } catch (Exception e) {
               return "";
           }
    }
}
