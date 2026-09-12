package org.example.dao;

import org.example.interfaces.FileUploadsDao;
import org.example.model.FileUploads;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileUploadDaoImpl implements FileUploadsDao {

// private map method  is used to generate object of FileUpload using ResultSet

    //single file upload
    @Override
    public FileUploads uploadFile(FileUploads fileUploads) {

        String sql = "call upload_file(?,?,?)";
        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, fileUploads.getFileName());
            callableStatement.setString(2, fileUploads.getFilePath());
            callableStatement.setInt(3, fileUploads.getUserId());

            try (ResultSet resultSet = callableStatement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;  // if true it will call custom map method
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    // Multi file upload
    @Override
    public List<FileUploads> uploadFiles(List<FileUploads> fileUploads) {

        List<FileUploads> fileUploadsList = new ArrayList<>();
        for (FileUploads fileUpload : fileUploads) {

         FileUploads saved = uploadFile(fileUpload);
         fileUploadsList.add(saved);
        }
        return fileUploadsList;
    }

      // Find file by fileId
        @Override
        public FileUploads findById ( int id){

            String sql = "call find_file_by_id(?)";

            try (Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(sql)) {

                callableStatement.setInt(1, id);

                try (ResultSet resultSet = callableStatement.executeQuery()) {

                    return resultSet.next() ? map(resultSet) : null;
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }

     // Find All Files of particular user
        @Override
        public List<FileUploads> findByUserId ( int id){

            String sql = "call find_files_by_user_id(?)";

            List<FileUploads> fileUploadsList = new ArrayList<>();

            try (Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(sql)) {

                callableStatement.setInt(1, id);

                try (ResultSet resultSet = callableStatement.executeQuery()) {

                    while (resultSet.next()) {
                        fileUploadsList.add(map(resultSet));
                    }

                    return fileUploadsList;
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        // get all files
        @Override
        public List<FileUploads> getALlFileUploads () {

            String sql = "call get_all_file_uploads()";

            List<FileUploads> fileUploadsList = new ArrayList<>();

            try (Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(sql);
                 ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    fileUploadsList.add(map(resultSet));
                }

                return fileUploadsList;

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        // delete file by id
        @Override
        public void deleteById ( int id){

            String sql = "call delete_file_by_id(?)";

            try (Connection connection = DBConnection.getConnection();
                 CallableStatement callableStatement = connection.prepareCall(sql)) {

                callableStatement.setInt(1, id);

                callableStatement.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

        private FileUploads map (ResultSet rs) throws SQLException { // create fileupload object using resultset
            return FileUploads.builder()
                    .id(rs.getInt("id"))
                    .fileName(rs.getString("FileName"))
                    .filePath(rs.getString("FilePath"))
                    .userId(rs.getInt("UserId"))
                    .build();
        }
    }


