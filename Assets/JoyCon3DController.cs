using UnityEngine;
using UnityEngine.InputSystem;

public class JoyCon3DController : MonoBehaviour
{
    public float moveSpeed = 5.0f;
    public float rotationSpeed = 200.0f;

    private Vector2 moveInput;
    private CharacterController characterController;

    private void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    private void OnEnable()
    {
        // Input System�̃A�N�V������L���ɂ���
        InputAction joyConMove = new InputAction("Move", InputActionType.PassThrough, "<Gamepad>/LeftStick");
        joyConMove.Enable();
        joyConMove.performed += OnJoyConMove;
    }

    private void OnDisable()
    {
        // Input System�̃A�N�V�����𖳌��ɂ���
        InputAction joyConMove = new InputAction("Move", InputActionType.PassThrough, "<Gamepad>/LeftStick");
        joyConMove.performed -= OnJoyConMove;
        joyConMove.Disable();
    }

    private void OnJoyConMove(InputAction.CallbackContext context)
    {
        // Joy-Con�̍��X�e�B�b�N�̓��͂��󂯎��
        moveInput = context.ReadValue<Vector2>();
        Debug.Log("Move Input3: " + moveInput);
    }

    private void Update()
    {
        Debug.Log("Move Input: " + moveInput);
        // �L�����N�^�[���ړ�������
        Vector3 moveDirection = new Vector3(moveInput.x, 0, moveInput.y);
        characterController.Move(moveDirection * moveSpeed * Time.deltaTime);

        // �L�����N�^�[�����E�ɉ�]������
        Vector3 rotation = new Vector3(0, moveInput.x, 0) * rotationSpeed * Time.deltaTime;
        transform.Rotate(rotation);
    }
}

