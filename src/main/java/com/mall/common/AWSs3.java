package com.mall.common;

import java.io.File;

import org.springframework.stereotype.Component;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
@Component("AWSs3")
public class AWSs3 {

    //Amazon-s3-sdk 
    private static final String BUCKET_NAME = "bucket_name";
    private static final String ACCESS_KEY = "AKIAVJN3R355NRJ6KR3K";
    private static final String SECRET_KEY = "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";
    private AmazonS3 amazonS3;
 
    public AWSs3() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
        amazonS3 = new AmazonS3Client(awsCredentials);
    }
 
    public void uploadFile(File file) {
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/img"/*sub directory*/, file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file
 
            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }
}
