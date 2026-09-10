package org.example.service;

import org.example.dao.FileUploadDaoImpl;
import org.example.interfaces.FileUploadsDao;
import org.example.model.FileUploads;

import java.util.List;

public class FileUploadService {
    private final FileUploadsDao fileUploadsDao;

    public FileUploadService() {
        this.fileUploadsDao = new  FileUploadDaoImpl();
    }

    // =========================================================
    // UPLOAD SINGLE FILE
    // =========================================================

    public FileUploads uploadFile(FileUploads fileUploads) {

        if (fileUploads == null) {
            throw new IllegalArgumentException("File data cannot be null");
        }

        return fileUploadsDao.uploadFile(fileUploads);
    }

    // =========================================================
    // UPLOAD MULTIPLE FILES
    // =========================================================

    public List<FileUploads> uploadFiles(List<FileUploads> fileUploads) {

        if (fileUploads == null || fileUploads.isEmpty()) {
            throw new IllegalArgumentException("File list cannot be empty");
        }

        return fileUploadsDao.uploadFiles(fileUploads);
    }

    // =========================================================
    // FIND FILE BY ID
    // =========================================================

    public FileUploads findById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid file ID");
        }

        return fileUploadsDao.findById(id);
    }

    // =========================================================
    // FIND FILES BY USER ID
    // =========================================================

    public List<FileUploads> findByUserId(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }

        return fileUploadsDao.findByUserId(id);
    }

    // =========================================================
    // GET ALL FILES
    // =========================================================

    public List<FileUploads> getALlFileUploads() {

        return fileUploadsDao.getALlFileUploads();
    }

    // =========================================================
    // DELETE FILE BY ID
    // =========================================================

    public void deleteById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid file ID");
        }

        fileUploadsDao.deleteById(id);
    }
}
