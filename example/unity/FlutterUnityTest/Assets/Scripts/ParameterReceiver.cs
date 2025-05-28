using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class ParameterReceiver : MonoBehaviour
{
    public TextMeshProUGUI TextMesh;

    // 接收 Flutter 发送的数字
    public void ReceiveNumber(string numberStr)
    {
        // 将字符串转为数字
        if (int.TryParse(numberStr, out int number))
        {
            TextMesh.text = numberStr;
        }
        else
        {
            TextMesh.text = "Invalid number format";
        }
    }
}
