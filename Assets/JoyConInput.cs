using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JoyConInput : MonoBehaviour
{
    public float moveSpeed = 5f; // キャラクターの移動速度

    private CharacterController characterController;

    void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        float horizontalInput = GetJoyConHorizontalInput();
        float verticalInput = GetJoyConVerticalInput();

        Vector3 moveDirection = transform.TransformDirection(new Vector3(horizontalInput, 0, verticalInput));
        moveDirection *= moveSpeed;

        characterController.Move(moveDirection * Time.deltaTime);
    }

    float GetJoyConHorizontalInput()
    {
        float input = 0f;

        // 左Joy-Conの左右のボタン（キー）を検出する処理を追加してください
        // 例えば：input = Input.GetKey(KeyCode.LeftArrow) ? -1f : (Input.GetKey(KeyCode.RightArrow) ? 1f : 0f);

        return input;
    }

    float GetJoyConVerticalInput()
    {
        float input = 0f;

        // 左Joy-Conの上下のボタン（キー）を検出する処理を追加してください
        // 例えば：input = Input.GetKey(KeyCode.UpArrow) ? 1f : (Input.GetKey(KeyCode.DownArrow) ? -1f : 0f);

        return input;
    }
}
