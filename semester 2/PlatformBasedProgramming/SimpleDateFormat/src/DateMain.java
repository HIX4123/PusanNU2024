import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateMain {


    public static void main(String[] args) {
        Date today = new Date();

        System.out.println(new SimpleDateFormat("yyyy년 mm월 dd일").format(today));
        System.out.println(new SimpleDateFormat("yyyy-mm-dd HH:mm:ss").format(today));
        System.out.println(new SimpleDateFormat("오늘은 이 달의 F번째 E요일 입니다.", Locale.KOREAN).format(today));
    }


}