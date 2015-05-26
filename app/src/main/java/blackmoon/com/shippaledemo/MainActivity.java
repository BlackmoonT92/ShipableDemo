package blackmoon.com.shippaledemo;

import com.crashlytics.android.Crashlytics;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import io.fabric.sdk.android.Fabric;

/**
 * Created by TamPhan on 5/26/15.
 */
public class MainActivity extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    Fabric.with(this, new Crashlytics());
    setContentView(R.layout.activity_main);

    Button btnCrash = (Button) findViewById(R.id.button);
    btnCrash.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        Crashlytics.getInstance().crash();
      }
    });
  // hello
  }
}
