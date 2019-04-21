import tink.testrunner.Runner;

@:keep
@:keepInit
@:build(hx.doctest.DocTestGenerator.generateDocTests())
class Main extends tink.testrunner.Suite.BasicSuite {

	static function __init__() {
		untyped __js__('global.window = {console:console}');
	}

    public static function main() {
        Runner.run(new Main());
    }

    function new() {
        super({name: Type.getClassName(Type.getClass(this))}, []);
    }

}



class MyTools {

    /**
     * <pre><code>
     * >>> MyTools.isValidName(null)   == false
     * >>> MyTools.isValidName("")     == false
     * >>> MyTools.isValidName("John") == true
     * </code></pre>
     */
    public static inline function isValidName(str:String):Bool {
        return str != null && str.length > 0;
    }
}


class MyObject {

    public var data:String;

    /**
     * <pre><code>
     * >>> new MyObject(null) throws "[data] must not be null!"
     * >>> new MyObject(null) throws ~/must not be null/
     * >>> new MyObject("ab") throws nothing
     * </code></pre>
     */
    public inline function new(data:String) {
        if(data == null) throw "[data] must not be null!";
        this.data = data;
    }

    /**
     * <pre><code>
     * >>> new MyObject("ab").length()  > 1
     * >>> new MyObject("ab").length()  <= 2
     * >>> new MyObject("abc").length() != 2
     * </code></pre>
     */
    public inline function length():Int {
        return data == null ? 0 : data.length;
    }

    /**
     * <pre><code>
     * >>> ({ var o=new MyObject("cat"); o.setData("dog"); o.data; }) == "dog"
     * </code></pre>
     */
    public inline function setData(data:String):Void {
        this.data = data;
    }
}