using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f; // キャラクターの移動速度

    private CharacterController characterController;

    void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        // Joy-Conの入力を取得
        float horizontalInput = Input.GetAxis("JoyHorizontal");
        float verticalInput = Input.GetAxis("JoyVertical");

        // 移動方向の計算
        Vector3 moveDirection = transform.TransformDirection(new Vector3(horizontalInput, 0, verticalInput));
        moveDirection *= moveSpeed;

        // キャラクターを移動させる
        characterController.Move(moveDirection * Time.deltaTime);
    }
}

