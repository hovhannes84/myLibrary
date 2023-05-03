package servlet;

import manager.AuthorManager;
import manager.BookManager;
import manager.UserManager;
import model.Author;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet("/createBook")
@MultipartConfig(maxFileSize = 1024*1024*5,maxRequestSize = 1024*1024*10,fileSizeThreshold = 1024*1024*1)
public class CreateBookServlet extends HttpServlet {

    private static final String UPLOAD_FOLDER = "C:\\Users\\Comp\\IdeaProjects\\myLibrary\\images\\";

    private AuthorManager authorManager = new AuthorManager();
    private BookManager bookManager = new BookManager();
    private UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> all = authorManager.getAll();
        req.setAttribute("authors", all);
        req.getRequestDispatcher("WEB-INF/createBook.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title= req.getParameter("title");
        String description = req.getParameter("description");
        int price = Integer.parseInt(req.getParameter("price"));
        int author_id = Integer.parseInt(req.getParameter("author_id"));
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        Part profilePicPart = req.getPart("profilePic");
        String picName = null;
        if (profilePicPart != null && profilePicPart.getSize() > 0) {
            picName = System.nanoTime() + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(UPLOAD_FOLDER + picName);
        }
        Book book = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getById(author_id))
                .user(userManager.getByUserId(user_id))
                .picName(picName)
                .build();
        bookManager.save(book);
        resp.sendRedirect("/books");
    }
}
