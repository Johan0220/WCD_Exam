package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Employee;

import java.io.IOException;

@WebServlet(value = "/edit-employee")
public class EmployeeEditController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee employee = session.get(Employee.class,Integer.parseInt(entityId));
            session.getTransaction().commit();
            if(employee != null) {
                req.setAttribute("employee", employee);
                req.getRequestDispatcher("employee/edit.jsp").forward(req, resp);
            }else
                resp.setStatus(404);
        }catch (Exception e){
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee employee = session.get(Employee.class,Integer.parseInt(entityId));
            if(employee != null) {
                employee.setEmployee_name(req.getParameter("employee_name"));
                employee.setEmail(req.getParameter("email"));
                employee.setPhone_number(req.getParameter("phone_number"));
                employee.setBirthday(req.getParameter("birthday"));
                // update to DB
                session.update(employee);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-employee");
        }catch (Exception e){
            resp.setStatus(500);
        }
    }


}
