package com.example.flutterworkshops

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager



class CompassService : SensorEventListener{
    private  var mSensorManager: SensorManager
    private  var mAccelerometer: Sensor
    private  var mMagnetometer: Sensor
    private  var onSensorData: (Double) -> Unit

    private var mGravity: FloatArray? = null
    private var mGeomagnetic: FloatArray? = null

    constructor(context: Context, onSensorData:  (Double) -> Unit){
        mSensorManager =  context.getSystemService(Context.SENSOR_SERVICE)  as SensorManager;
        mAccelerometer = mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        mMagnetometer = mSensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD)
        this.onSensorData = onSensorData
    }

    fun start(){
        mSensorManager.registerListener(this, mAccelerometer, SensorManager.SENSOR_DELAY_NORMAL)
        mSensorManager.registerListener(this, mMagnetometer, SensorManager.SENSOR_DELAY_NORMAL)
    }

    fun stop(){
        mSensorManager.unregisterListener(this)
    }

    override fun onAccuracyChanged(p0: Sensor?, p1: Int) {

    }


    override fun onSensorChanged(event: SensorEvent?) {
        if (event == null){
            return
        }
        if (event.sensor.type == Sensor.TYPE_ACCELEROMETER) mGravity = event.values
        if (event.sensor.type == Sensor.TYPE_MAGNETIC_FIELD) mGeomagnetic = event.values
        if (mGravity != null && mGeomagnetic != null) {
            val R = FloatArray(9)
            val I = FloatArray(9)
            val success = SensorManager.getRotationMatrix(R, I, mGravity, mGeomagnetic)
            if (success) {
                val orientation = FloatArray(3)
                SensorManager.getOrientation(R, orientation)
                val azimuth = Math.toDegrees(orientation[0].toDouble()) // orientation contains: azimut, pitch and roll
                onSensorData(azimuth)
            }
        }

    }


}