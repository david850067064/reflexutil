package net.kandov.reflexutil.utils {
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	public class ClassUtil {
		
		public static function getClassName(object:Object):String {
	        var name:String = getQualifiedClassName(object);
	        
			var index:int;
			if ((index = name.indexOf ("::")) != -1) {
				name = name.substr(index + 2);
			} else if ((index = name.indexOf ('as$')) != -1){
				name = name.slice(index + 3);
			}
	        
	        return name;
		}
		
		public static function determineType(value:Object, classType:String):String {
			if (!value) {
				return null;
			}
			
			var type:String = typeof(value);
			
			if (type == "number") {
				if (classType == "int") {
					return "int";
				}
			}
			
			if (type == "object") {
				if (value is Date) {
					return "Date";
				}
			}
			
			return type;
		}
		
	}
}