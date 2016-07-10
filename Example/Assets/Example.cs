using System.Runtime.InteropServices;

public class Example {
    #if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")]
    private static extern void _ex_callSwiftMethod(string message);
    #endif

    public static void CallSwiftMethod(string message) {
	    #if UNITY_IOS && !UNITY_EDITOR
	    _ex_callSwiftMethod(message);
    	#endif
    }
}
