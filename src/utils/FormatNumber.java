package utils;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class FormatNumber {
	public static String formatNumber(int number) {
        try {
            NumberFormat formatter = new DecimalFormat("###,###");
            String resp = formatter.format(number);
            resp = resp.replaceAll(",", ".");
            return resp;
        } catch (Exception e) {
            return "";
        }
    }

}
