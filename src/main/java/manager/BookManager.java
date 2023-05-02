package manager;

import com.example.mylibrary.db.DBConectionProvider;
import model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookManager {
    private DBConectionProvider DBConnectionProvider;
    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private AuthorManager authorManager = new AuthorManager();

    public void save(Book book) {
        String sql = "INSERT INTO book(title, description, price,author_id,user_id,pic_name) VALUES(?,?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setString(3, String.valueOf(book.getPrice()));
            ps.setString(4, String.valueOf(book.getAuthor().getId()));
            ps.setString(5, String.valueOf(book.getUser_id()));
            ps.setString(6, book.getPicName());
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()) {
                book.setId(generatedKeys.getInt(1));
            }
            System.out.println("book inserted into DB");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getById(int id) {
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("Select * from book where id = " + id);
            if (resultSet.next()) {
                return getBookFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getAll() {
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from book");
            while (resultSet.next()) {
                books.add(getBookFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }



    private Book getBookFromResultSet(ResultSet resultSet) throws SQLException {
        Book book = new Book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("title"));
        book.setDescription(resultSet.getString("description"));
        book.setPrice(resultSet.getInt("price"));
        book.setAuthor(authorManager.getById(resultSet.getInt("author_id")));
        book.setUser_id(resultSet.getInt("user_id"));
        book.setPicName(resultSet.getString("pic_name"));
        return book;
    }


    public void removeById(int bookId) {
        String sql = "DELETE FROM book WHERE id = " + bookId;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void update(Book book) {
        String sql = "UPDATE book SET title = '%s', description = '%s',price =%d,author_id = %d WHERE id = %d";
        try(Statement statement = connection.createStatement()){
            statement.executeUpdate(String.format(sql, book.getTitle(), book.getDescription(), book.getPrice(),book.getAuthor().getId(),book.getId()));
        } catch (SQLException e) {
            e.printStackTrace();

        }
        System.out.println("book updated ");

    }

}
