using UnityEngine;
using System.IO;

public class eee : MonoBehaviour
{
    int[] num = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

    // Start is called before the first frame update
    void Start()
    {
        StreamWriter sw = new StreamWriter("./Assets/TextData.txt", false); // TextData.txt�Ƃ����t�@�C����V�K�ŗp��

        foreach (int i in num)
        {
            sw.WriteLine(i);// �t�@�C���ɏ����o�������Ɖ��s
        }

        sw.WriteLine("�����");

        sw.Flush();
        sw.Close();

    }
}