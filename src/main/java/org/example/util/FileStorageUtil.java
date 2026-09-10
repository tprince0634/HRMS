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


    // ROOT DIRECTORY
    // Parent folder that holds every upload sub-folder
    // (uploads/, profilePictures/, taskDocs/, ...)

    private static final String ROOT_DIRECTORY =
            "C:/Users/Asus/OneDrive/Desktop/EliteNex Notes/Projects/Hrms/HRMS";


    // Common folder names — use these instead of typing raw strings
    // at call sites so a typo can't create a stray folder.
    public static final String FOLDER_DOCUMENTS = "uploads";
    public static final String FOLDER_PROFILE_PICTURES = "profilePictures";
    public static final String FOLDER_TASK_DOCS = "taskDocs";


    // SAVE FILE (folder-aware)


    public static String saveFile(Part filePart, String folderName) throws IOException {

        if (folderName == null || folderName.isBlank()) {
            folderName = FOLDER_DOCUMENTS;
        }

        // Create <ROOT_DIRECTORY>/<folderName> if it doesn't exist
        Path uploadPath =
                Paths.get(ROOT_DIRECTORY, folderName);

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


        // Return path that can be stored in database, e.g. "uploads/<uuid>_name.jpg"
        // or "profilePictures/<uuid>_name.jpg" depending on folderName
        return folderName + "/" + uniqueFileName;
    }


    // SAVE FILE (backward-compatible overload)
    // Existing call sites that don't pass a folder still work,
    // and default to the "uploads" folder.

    public static String saveFile(Part filePart) throws IOException {
        return saveFile(filePart, FOLDER_DOCUMENTS);
    }



    // GET PHYSICAL FILE PATH


    public static Path getFilePath(String relativePath) {

        // relativePath is now always "<folderName>/<fileName>"
        // (e.g. "uploads/xxx.jpg", "profilePictures/xxx.png"),
        // so we just resolve it straight against the root.
        return Paths.get(
                ROOT_DIRECTORY,
                relativePath
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