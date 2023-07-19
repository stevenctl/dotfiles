extends Object
#brief Singleton that connects the engine with Android plugins to interface with native Android code.
#desc The JNISingleton is implemented only in the Android export. It's used to call methods and connect signals from an Android plugin written in Java or Kotlin. Methods and signals can be called and connected to the JNISingleton as if it is a Node. See [url=https://en.wikipedia.org/wiki/Java_Native_Interface]Java Native Interface - Wikipedia[/url] for more information.
#tutorial [Creating Android plugins] https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#doc-android-plugin
class_name JNISingleton





