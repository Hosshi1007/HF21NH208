package com.example;

import java.security.Key;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class AESEncryption {



    private static final String ALGORITHM = "AES";// 暗号アルゴリズム
    private static final String KEY = "mysecretkey";// 秘密鍵 (16, 24, または 32 バイト)



    // 文字列を暗号化するメソッド
    public static String encrypt(String value) throws Exception {
        // 鍵を生成
        Key key = generateKey();

        Cipher cipher = Cipher.getInstance(ALGORITHM);// 暗号化処理用のCipherオブジェクトを生成

        cipher.init(Cipher.ENCRYPT_MODE, key);// Cipherオブジェクトを初期化して、暗号化モードで使用することを指定

        byte[] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));// 文字列をバイト配列に変換して暗号化

        return Base64.getEncoder().encodeToString(encryptedByteValue);// 暗号化されたバイト配列をBase64エンコードして文字列に変換して返す
    }




    // 文字列を復号化するメソッド
    public static String decrypt(String value) throws Exception {

        Key key = generateKey();// 鍵を生成

        Cipher cipher = Cipher.getInstance(ALGORITHM);// 復号化処理用のCipherオブジェクトを生成

        cipher.init(Cipher.DECRYPT_MODE, key);// Cipherオブジェクトを初期化して、復号化モードで使用することを指定

        byte[] decryptedValue64 = Base64.getDecoder().decode(value);// Base64デコードして復号化

        return new String(cipher.doFinal(decryptedValue64), "utf-8");// 復号化されたバイト配列を取得し、文字列に変換して返す
    }





    // 鍵を生成するメソッド
    private static Key generateKey() throws Exception {

        MessageDigest sha = MessageDigest.getInstance("SHA-256");// ハッシュアルゴリズムを使用して秘密鍵を生成

        byte[] keyBytes = sha.digest(KEY.getBytes());// キーをバイト配列に変換

        keyBytes = Arrays.copyOf(keyBytes, 16);// 最初の128ビットだけを使用してキーを生成

        return new SecretKeySpec(keyBytes, ALGORITHM); // 生成されたキーをSecretKeySpecオブジェクトとして返す
    }



}