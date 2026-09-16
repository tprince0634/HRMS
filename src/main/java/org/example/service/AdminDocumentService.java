package org.example.service;

import org.example.dao.AdminDocumentDaoImpl;
import org.example.interfaces.AdminDocumentDao;
import org.example.model.AdminDocument;

import java.util.List;

public class AdminDocumentService {

    private final AdminDocumentDao adminDocumentDao;

    public AdminDocumentService() {
        this.adminDocumentDao = new AdminDocumentDaoImpl();
    }

    public AdminDocument addAdminDocument(AdminDocument adminDocument) {
        return adminDocumentDao.addAdminDocument(adminDocument);
    }

    public AdminDocument getAdminDocumentById(int adminDocId) {
        return adminDocumentDao.getAdminDocumentById(adminDocId);
    }

    public List<AdminDocument> getAllAdminDocuments() {
        return adminDocumentDao.getAllAdminDocuments();
    }

    public List<AdminDocument> getAdminDocumentsByEmail(String email) {
        return adminDocumentDao.getAdminDocumentsByEmail(email);
    }

    public boolean deleteAdminDocument(int adminDocId) {
        return adminDocumentDao.deleteAdminDocument(adminDocId);
    }
}