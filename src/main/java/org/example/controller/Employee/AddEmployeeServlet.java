package org.example.controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import org.example.service.UserServiceImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1 MB
        maxFileSize = 5 * 1024 * 1024,         // 5 MB
        maxRequestSize = 10 * 1024 * 1024      // 10 MB
)
@WebServlet("/Employee/AddEmployee")
public class AddEmployeeServlet extends HttpServlet {

    private UserServiceImpl userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            // =================================================
            // BASIC INFORMATION
            // =================================================

            String firstName =
                    request.getParameter("firstName");

            String lastName =
                    request.getParameter("lastName");

            String email =
                    request.getParameter("email");

            String password =
                    request.getParameter("password");

            String phoneNumber =
                    request.getParameter("phoneNumber");


            // =================================================
            // ROLE
            // =================================================

            int roleId =
                    Integer.parseInt(
                            request.getParameter("roleId")
                    );


            // =================================================
            // DEPARTMENT
            // =================================================

            String departmentValue =
                    request.getParameter("departmentId");

            Integer departmentId =
                    departmentValue == null ||
                            departmentValue.isBlank()
                            ? null
                            : Integer.parseInt(departmentValue);


            // =================================================
            // DESIGNATION
            // =================================================

            String designationValue =
                    request.getParameter("designationId");

            Integer designationId =
                    designationValue == null ||
                            designationValue.isBlank()
                            ? null
                            : Integer.parseInt(designationValue);


            // =================================================
            // DATES
            // =================================================

            String dateOfJoining =
                    request.getParameter("dateOfJoining");

            String dateOfBirth =
                    request.getParameter("dateOfBirth");


            // =================================================
            // OTHER INFORMATION
            // =================================================

            String gender =
                    request.getParameter("gender");

            String address =
                    request.getParameter("address");

            String aboutEmployee =
                    request.getParameter("aboutEmployee");

            String reportingManager =
                    request.getParameter("reportingManager");

            String status =
                    request.getParameter("status");


            // =================================================
            // PROFILE PICTURE
            // =================================================

            String profilePicture = "avatar-02.jpg";

            Part profilePart =
                    request.getPart("profileImage");


            if (profilePart != null &&
                    profilePart.getSize() > 0) {

                String submittedFileName =
                        profilePart.getSubmittedFileName();

                String originalFileName =
                        Paths.get(submittedFileName)
                                .getFileName()
                                .toString();


                // ---------------------------------------------
                // Validate extension
                // ---------------------------------------------

                String lowerFileName =
                        originalFileName.toLowerCase();

                if (!lowerFileName.endsWith(".jpg") &&
                        !lowerFileName.endsWith(".jpeg") &&
                        !lowerFileName.endsWith(".png") &&
                        !lowerFileName.endsWith(".webp")) {

                    request.setAttribute(
                            "error",
                            "Only JPG, JPEG, PNG and WEBP images are allowed."
                    );

                    request.getRequestDispatcher(
                            "/WEB-INF/views/EmployeeList.jsp"
                    ).forward(request, response);

                    return;
                }


                // ---------------------------------------------
                // Generate unique filename
                // ---------------------------------------------

                String extension =
                        originalFileName.substring(
                                originalFileName.lastIndexOf(".")
                        );

                String uniqueFileName =
                        "employee_" +
                                System.currentTimeMillis() +
                                extension;


                // ---------------------------------------------
                // Upload directory
                // ---------------------------------------------

                String uploadPath =
                        getServletContext()
                                .getRealPath(
                                        "/assets/img/profiles"
                                );


                File uploadDirectory =
                        new File(uploadPath);


                if (!uploadDirectory.exists()) {
                    uploadDirectory.mkdirs();
                }


                // ---------------------------------------------
                // Save actual image
                // ---------------------------------------------

                File savedFile =
                        new File(
                                uploadDirectory,
                                uniqueFileName
                        );

                profilePart.write(
                        savedFile.getAbsolutePath()
                );


                // ---------------------------------------------
                // Store ONLY filename in database
                // ---------------------------------------------

                profilePicture =
                        uniqueFileName;
            }


            // =================================================
            // CREATED BY
            // =================================================

            HttpSession session =
                    request.getSession(false);

            String createdBy = null;

            if (session != null) {

                createdBy =
                        (String) session.getAttribute(
                                "userEmail"
                        );
            }

            if (createdBy == null) {
                createdBy = "Admin";
            }


            // =================================================
            // PASSWORD
            // =================================================

            String passwordHash = password;


            // =================================================
            // SAVE EMPLOYEE
            // =================================================

            boolean saved =
                    userService.addEmployee(
                            firstName,
                            lastName,
                            email,
                            passwordHash,
                            phoneNumber,
                            roleId,
                            departmentId,
                            designationId,
                            dateOfJoining,
                            dateOfBirth,
                            gender,
                            address,
                            aboutEmployee,
                            profilePicture,
                            reportingManager,
                            status,
                            createdBy
                    );


            // =================================================
            // SUCCESS
            // =================================================

            if (saved) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/Employee/EmployeeList"
                );

                return;
            }


            // =================================================
            // FAILURE
            // =================================================

            request.setAttribute(
                    "error",
                    "Employee could not be added."
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/EmployeeList.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Error while adding employee: "
                            + e.getMessage()
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/EmployeeList.jsp"
            ).forward(request, response);
        }
    }
}