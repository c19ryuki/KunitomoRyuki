using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class GyroCamera : MonoBehaviour
{

    private Quaternion gyro;


    //public static float hh;
    static public float sum;

    public float rotateSpeed = 2.0f;

    // Use this for initialization
    void Start()
    {
        Input.compass.enabled = true;
        Input.gyro.enabled = true;


    }

    // Update is called once per frame
    void Update()
    {

        this.gyro = Input.gyro.attitude;

        //// 加速度センサを利用してCubeを移動
        //float speed = 5.0f;

        //var dir = Vector3.zero;
        //dir.x = Input.acceleration.x;
        //dir.y = Input.acceleration.y;

        //if (dir.sqrMagnitude > 1)
        //{
        //    dir.Normalize();
        //}

        //dir *= Time.deltaTime;

        //transform.Translate(dir * speed);

        //地磁気センサーから値を取得
        //transform.rotation = Quaternion.Euler(0, -Input.compass.trueHeading, 0);

        // ジャイロセンサの値を取得し、Unity内のカメラと同期
        //this.transform.localRotation = Quaternion.Euler(90, 0, 0) * (new Quaternion(-gyro.x, -gyro.y, gyro.z, gyro.w));

        Quaternion aa = Quaternion.Euler(90, 0, 0) * (new Quaternion(-gyro.x, -gyro.y, gyro.z, gyro.w));
        Quaternion bb = aa;

        Quaternion cc = aa;


        bb.eulerAngles = new Vector3(0.0f, aa.eulerAngles.y + sum, 0.0f);


        cc.eulerAngles = new Vector3(aa.eulerAngles.x, bb.eulerAngles.y, 0.0f);
        this.transform.rotation = cc;



        // Cubeの位置を任意の位置に変更
        //Vector3 pos = transform.position;
        //pos.x = 0.5f;
        //transform.position = pos;
        //Debug.Log(transform.position);

        //// OK
        //transform.position = new Vector3(
        //    -4,
        //    -1,
        //    5);
    }
}
