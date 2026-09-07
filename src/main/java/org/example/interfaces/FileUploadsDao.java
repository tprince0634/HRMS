package org.example.interfaces;

import org.example.model.FileUploads;

import java.util.List;

public interface FileUploadsDao {

    FileUploads uploadFile(FileUploads fileUploads);
    List<FileUploads> uploadFiles(List<FileUploads> fileUploads);
    FileUploads findById(int id);
    List<FileUploads> findByUserId(int id);
    List<FileUploads>  getALlFileUploads();
    void deleteById(int id);
}
