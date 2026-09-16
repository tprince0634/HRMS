package org.example.interfaces;

import org.example.model.AdminDocument;

import java.util.List;

public interface AdminDocumentDao {

    AdminDocument addAdminDocument(AdminDocument adminDocument);

    AdminDocument getAdminDocumentById(int adminDocId);

    List<AdminDocument> getAllAdminDocuments();

    List<AdminDocument> getAdminDocumentsByEmail(String email);

    boolean deleteAdminDocument(int adminDocId);
}
