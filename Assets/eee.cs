using UnityEngine;
using System.IO;

public class eee : MonoBehaviour
{
    int[] num = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

    // Start is called before the first frame update
    void Start()
    {
        StreamWriter sw = new StreamWriter("./Assets/TextData.txt", false); // TextData.txtというファイルを新規で用意

        foreach (int i in num)
        {
            sw.WriteLine(i);// ファイルに書き出したあと改行
        }

        sw.WriteLine("おわり");

        sw.Flush();
        sw.Close();

    }
}