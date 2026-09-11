package org.example.controller.reports;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.PayslipReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/payslip-report")
public class PayslipReportServlet extends HttpServlet {

    private ReportService reportService;

    @Override
    public void init() throws ServletException {
        reportService = new ReportService();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {

            // Get all payslips
            List<PayslipReport> payslipList =
                    reportService.getAllPayslips();

            // Calculate report cards
            double totalPayroll = 0;
            double totalEarnings = 0;
            double totalDeductions = 0;
            double totalNetPay = 0;

            for (PayslipReport payslip : payslipList) {

                totalPayroll += payslip.getTotalSalary();
                totalEarnings += payslip.getEarnings();
                totalDeductions += payslip.getDeductions();
                totalNetPay += payslip.getNetPay();
            }

            // Send data to JSP
            request.setAttribute("payslipList", payslipList);

            request.setAttribute("totalPayroll", totalPayroll);
            request.setAttribute("totalEarnings", totalEarnings);
            request.setAttribute("totalDeductions", totalDeductions);
            request.setAttribute("totalNetPay", totalNetPay);

            // Forward to JSP
            request.getRequestDispatcher(
                    "/views/admin/reports/payslip-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load payslip report."
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/payslip-report.jsp"
            ).forward(request, response);
        }
    }
}