package commons;

import java.security.MessageDigest;

public class EncryptionUtils {
	public static String sha512(String msg) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(msg.getBytes());
		StringBuilder builder = new StringBuilder();
		for (byte b: md.digest()) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
	public static String AntiXSS(String text) {
		text = text.replaceAll("<", "&lt;").replaceAll(">","&gt;");
        text = text.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
        text = text.replaceAll("'", "&#39;");
        text = text.replaceAll("eval\\((.*)\\)","");
        text = text.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
        text = text.replaceAll("script","");
        text = text.replaceAll("<script>", "&lt;script>");
        
        System.out.println("XSS Filter after : " + text);
		return text;
	}
	
	
	 
}