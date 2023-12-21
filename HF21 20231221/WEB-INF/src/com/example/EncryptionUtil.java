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

    // 後ろのコンマ以降の文字列を取得するメソッド
    public String getAfterCommaPart(String text) {
        int lastCommaIndex = text.lastIndexOf(",");
        if (lastCommaIndex != -1 && lastCommaIndex < text.length() - 1) {
            return text.substring(lastCommaIndex + 1);
        } else {
            return text;
        }
    }



}