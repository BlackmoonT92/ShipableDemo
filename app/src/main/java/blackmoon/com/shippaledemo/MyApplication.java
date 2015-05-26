package blackmoon.com.shippaledemo;

/**
 * Created by MacPro on 5/19/15.
 */

import android.app.Application;
import com.crashlytics.android.Crashlytics;
import io.fabric.sdk.android.Fabric;

public class MyApplication extends Application {

  @Override
  public void onCreate() {
    super.onCreate();
    Fabric.with(this, new Crashlytics());

    // Example: single kit
    // TwitterAuthConfig authConfig =
    //         new TwitterAuthConfig("consumerKey",
    //                                     "consumerSecret");

    // Fabric.with(this, new Twitter(authConfig));

    // Example: multiple kits
    // Fabric.with(this, new Twitter(authConfig),
    //                  new Crashlytics());
  }
}