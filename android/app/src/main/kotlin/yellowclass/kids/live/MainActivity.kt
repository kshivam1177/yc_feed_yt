package yellowclass.kids.live

import android.content.BroadcastReceiver
import android.os.Bundle
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import com.google.firebase.analytics.FirebaseAnalytics
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {

    private val CHANNEL = "yellowclass.com/channel"
    private val EVENTS = "yellowclass.com/events"
    private var startString: String? = null
    private var linksReceiver: BroadcastReceiver? = null

    private val NOTIFICATIONCHANNEL = "yellowclass.com/onReceived"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        SingletonNotificationChannel.notificationChannel =
                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NOTIFICATIONCHANNEL)

        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "initialLink") {
                result.success(startString)
            } else if (call.method == "gtmHandler") {
                handleGTM(result = result, call = call)
            } else {
//                handleNewRelicCalls(result = result, call = call, this)
            }
        }

        EventChannel(flutterEngine.dartExecutor, EVENTS).setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(args: Any?, events: EventSink) {
                        linksReceiver = createChangeReceiver(events)
                    }

                    override fun onCancel(args: Any?) {
                        linksReceiver = null
                    }
                }
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

//        initNewRelic(this)

        val intent = getIntent()
        startString = intent.data?.toString()

        //todo: shivam => for global error catching ... (in-progress)
        Thread.setDefaultUncaughtExceptionHandler { t: Thread, e: Throwable ->
            val _error = "onCreate: globalErrorFound (Thread-" + t.name + ") => (Error-" + e.message + " )"
//            Toast.makeText(this,_error,Toast.LENGTH_SHORT).show()
//            Log.e("TAG-SHIVAM", _error)
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.action === Intent.ACTION_VIEW) {
            linksReceiver?.onReceive(this.applicationContext, intent)
        }
        setIntent(intent)
    }

    fun createChangeReceiver(events: EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(
                    context: Context,
                    intent: Intent
            ) { // NOTE: assuming intent.getAction() is Intent.ACTION_VIEW
                val dataString =
                        intent.dataString ?: events.error("UNAVAILABLE", "Link unavailable", null)
                events.success(dataString)
            }
        }
    }

    private fun handleGTM(result: MethodChannel.Result, call: MethodCall) {

        val mFirebaseAnalytics: FirebaseAnalytics = FirebaseAnalytics.getInstance(this);

        val category: String = call.argument<String>("category").toString();
        val action: String = call.argument<String>("action").toString();
        val label: String = call.argument<String>("label").toString();
        val other: String = call.argument<String>("other").toString();
        val sessionData: String = call.argument<String>("sessiondata").toString();

        val params = Bundle()
        params.putString("category", category)
        params.putString("action", action)
        params.putString("label", label)
        params.putString("other", other)
        params.putString("sessiondata", sessionData)

        mFirebaseAnalytics.logEvent(action, params)

//        Log.e(
//            "MainActivity",
//            "handleGTM: ${call.arguments}\n DATA GOTT:: \n category: $category, action: $action,label : $label,  other: $other,  dimension1: $dimension1, dimension3: $dimension3, sessiondata: $sessionData"
//        )
    }
}
