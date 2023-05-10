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
		return text.replaceAll("<script>", "&lt;script>");
	}
	
}