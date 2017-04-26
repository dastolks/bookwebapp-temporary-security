package edu.wctc.web.demo.bookwebapp.repository;

import edu.wctc.web.demo.bookwebapp.entity.Book;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author jlombardo
 */
@Repository
public interface BookRepository extends JpaRepository<Book, Integer>, Serializable {
    
    @Query("SELECT b FROM Book b WHERE b.authorId.authorId = :id")
    public abstract List<Book> searchByAuthorId(@Param("id") Integer id);
    
    @Query("SELECT b FROM Book b WHERE b.authorId.authorId = :id AND b.isbn LIKE :isbn%")
    public abstract List<Book> searchByAuthorIdAndIsbn(@Param("id") Integer id, @Param("isbn") String isbn);
    
    @Query("SELECT b FROM Book b WHERE b.isbn LIKE :isbn%")
    public abstract List<Book> searchByIsbn(@Param("isbn") String isbn);
    
    @Query("SELECT b FROM Book b WHERE b.authorId.authorId = :id AND b.title LIKE :title%")
    public abstract List<Book> searchByAuthorIdAndTitle(@Param("id") Integer id, @Param("title") String title);
    
    @Query("SELECT b FROM Book b WHERE b.title LIKE :title%")
    public abstract List<Book> searchByTitle(@Param("title") String title);
    
    @Query("SELECT b FROM Book b WHERE b.authorId.authorId = :id AND b.isbn LIKE :isbn% AND b.title LIKE :title%")
    public abstract List<Book> searchByAuthorIdAndIsbnAndTitle(@Param("id") Integer id, @Param("isbn") String isbn, @Param("title") String title);
    
    @Query("SELECT b FROM Book b WHERE b.isbn LIKE :isbn% AND b.title LIKE :title%")
    public abstract List<Book> searchByIsbnAndTitle(@Param("isbn") String isbn, @Param("title") String title);
}
