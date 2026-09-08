package org.example.util;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class FileStorageUtil {


    // UPLOAD DIRECTORY


    // Physical location where files will actually be stored
    private static final String UPLOAD_DIRECTORY =
            "C:/Users/Asus/OneDrive/Desktop/EliteNex Notes/Projects/Hrms/HRMS/uploads";



    // SAVE FILE


    public static String saveFile(Part filePart) throws IOException {

        // Create upload directory if it doesn't exist
        Path uploadPath =
                Paths.get(UPLOAD_DIRECTORY);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }


        // Get original file name
        String originalFileName =
                Paths.get(
                        filePart.getSubmittedFileName()
                ).getFileName().toString();


        // Generate unique file name
        String uniqueFileName =
                UUID.randomUUID() +
                "_" +
                originalFileName;


        // Complete physical file path
        Path filePath =
                uploadPath.resolve(uniqueFileName);


        // Save uploaded file
        try (InputStream inputStream =
                     filePart.getInputStream()) {

            Files.copy(
                    inputStream,
                    filePath,
                    StandardCopyOption.REPLACE_EXISTING
            );
        }


        // Return path that can be stored in database
        return "uploads/" + uniqueFileName;
    }



    // GET PHYSICAL FILE PATH


    public static Path getFilePath(String relativePath) {

        // Remove "uploads/" from database path
        String fileName =
                relativePath.replace(
                        "uploads/",
                        ""
                );

        return Paths.get(
                UPLOAD_DIRECTORY,
                fileName
        );
    }



    // CHECK FILE EXISTS


    public static boolean fileExists(String relativePath) {

        Path filePath =
                getFilePath(relativePath);

        return Files.exists(filePath);
    }



    // GET FILE SIZE


    public static long getFileSize(
            String relativePath)
            throws IOException {

        Path filePath =
                getFilePath(relativePath);

        return Files.size(filePath);
    }



    // GET FILE INPUT STREAM


    public static InputStream getInputStream(
            String relativePath)
            throws IOException {

        Path filePath =
                getFilePath(relativePath);

        return Files.newInputStream(filePath);
    }



    // GET CONTENT TYPE


    public static String getContentType(
            String relativePath)
            throws IOException {

        Path filePath =
                getFilePath(relativePath);

        String contentType =
                Files.probeContentType(filePath);

        if (contentType == null) {
            contentType =
                    "application/octet-stream";
        }

        return contentType;
    }


    // DELETE FILE


    public static boolean deleteFile(
            String relativePath)
            throws IOException {

        Path filePath =
                getFilePath(relativePath);

        return Files.deleteIfExists(filePath);
    }
}