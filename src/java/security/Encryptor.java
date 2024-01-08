/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encryptor {

    //Advanced Encryption Standard
    //128 bit
    static byte[] IV = {0x01, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};

    public String encrypt(String input, byte[] secretKey) throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidAlgorithmParameterException, InvalidKeyException,
            BadPaddingException, IllegalBlockSizeException {

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        SecretKeySpec key = new SecretKeySpec(secretKey, "AES");
        cipher.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(IV));
        byte[] cipherText = cipher.doFinal(input.getBytes());
        return Base64.getEncoder()
                .encodeToString(cipherText);
    }

    public String decrypt(String cipherText, byte[] secretKey) throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidAlgorithmParameterException, InvalidKeyException,
            BadPaddingException, IllegalBlockSizeException {

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        SecretKeySpec key = new SecretKeySpec(secretKey, "AES");
        cipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(IV));
        byte[] plainText = cipher.doFinal(Base64.getDecoder()
                .decode(cipherText));
        return new String(plainText);
    }

    public byte[] stringToByteArray(String keyString) {
        String[] keyFragments = keyString.split(" ");

        byte[] key = new byte[16];
        for (int i = 0; i < keyFragments.length; i++) {
            key[i] = Byte.parseByte(keyFragments[i]);
        }
        return key;
    }
    
     public static void main(String[] args) throws NoSuchPaddingException, InvalidKeyException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
        Encryptor encryptor = new Encryptor();

        //128 bit
        byte[] encryptionKey = {65, 12, 12, 12, 12, 12, 12, 12, 12,
                12, 12, 12, 12, 12, 12, 12 };

        String stringKey = "65 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12";


        byte[] key = encryptor.stringToByteArray(stringKey);

        String input = "4mmx/39+4MAIjIQtjKBBeQ==";

//        System.out.println(encryptor.encrypt(input,key));
        //output: VyEcl0pLeqQLemGONcik0w==

        System.out.println(encryptor.decrypt("mOTP8SE0yDLu6p3g5hVsWQ==",key));
    }
}
