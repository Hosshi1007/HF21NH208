package com.example;

public class EncryptionUtil {

    // データベースからの暗号化されたテキストを復号化するメソッド
    public String decryptTextFromDatabase(String encryptedText) {
        try {

            return AESEncryption.decrypt(encryptedText);// AESEncryption クラスを使用して暗号文を復号化

        } catch (Exception e) {

            e.printStackTrace();

            return "";// 復号化に失敗した場合
        }
    }
}