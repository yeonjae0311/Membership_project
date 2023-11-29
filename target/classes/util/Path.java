package util;

public class Path {
	private final static String VIEW_PATH = "/WEB-INF/views/";
	
	public static class HomePath{
		public static String make_path(String file) {
			return VIEW_PATH + file + ".jsp";
		}
	}
	
	public static class LoginPath{
		public static String make_path(String file) {
			return VIEW_PATH + "login/" + file + ".jsp";
		}
	}
	
	public static class RegisterPath{
		public static String make_path(String file) {
			return VIEW_PATH + "register/" + file + ".jsp";
		}
	}
	
	public static class StoryPath{
		public static String make_path(String file) {
			return VIEW_PATH + "story/" + file + ".jsp";
		}
	}
	
	public static class BoardPath{
		public static String make_path(String file) {
			return VIEW_PATH + "board/" + file + ".jsp";
		}
	}
	
	public static class ShopPath{
		public static String make_path(String file) {
			return VIEW_PATH + "shop/" + file + ".jsp";
		}
	}
	
	public static class ShoppingCart_Path{
		public static String make_path(String file) {
			return VIEW_PATH + "shopping_card/" + file + ".jsp";
		}
	}
	
	public static class UserPath{
		public static String make_path(String file) {
			return VIEW_PATH + "user/" + file + ".jsp";
		}
	}
}
