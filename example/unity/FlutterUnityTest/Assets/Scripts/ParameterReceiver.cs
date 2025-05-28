using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class ParameterReceiver : MonoBehaviour
{
    public TextMeshProUGUI TextMesh;

    // ���� Flutter ���͵�����
    public void ReceiveNumber(string numberStr)
    {
        // ���ַ���תΪ����
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
