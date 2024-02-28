package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import wcd.jpa.entities.Employee;
import java.io.IOException;


@WebServlet("/create-employee")
public class EmployeeCreateController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // query db
        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();
            session.getTransaction().commit();
        }
        req.getRequestDispatcher("employee/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setEmployee_name(req.getParameter("employee_name"));
        employee.setEmail(req.getParameter("email"));
        employee.setPhone_number(req.getParameter("phone_number"));
        employee.setBirthday(req.getParameter("birthday"));
    }
}
