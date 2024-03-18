using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f; // �L�����N�^�[�̈ړ����x

    private CharacterController characterController;

    void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        // Joy-Con�̓��͂��擾
        float horizontalInput = Input.GetAxis("JoyHorizontal");
        float verticalInput = Input.GetAxis("JoyVertical");

        // �ړ������̌v�Z
        Vector3 moveDirection = transform.TransformDirection(new Vector3(horizontalInput, 0, verticalInput));
        moveDirection *= moveSpeed;

        // �L�����N�^�[���ړ�������
        characterController.Move(moveDirection * Time.deltaTime);
    }
}

