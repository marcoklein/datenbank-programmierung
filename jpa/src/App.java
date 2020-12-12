import java.io.FileInputStream;
import java.util.List;
import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class App {
    public static void main(String[] args) throws Exception {
        Properties props = new Properties();
        props.load(new FileInputStream("application.properties"));

        System.out.println("Creating the JPA connection...");

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("favorite_number_unit", props);
        System.out.println("Succesfully created the schema for favorite numbers");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        FavoriteNumber favNum = new FavoriteNumber();
        favNum.setNumber(3);
        favNum.setReason("Three is just awesome.");
        em.persist(favNum);

        // write to database
        em.getTransaction().commit();

        em.getTransaction().begin();

        User user = new User();
        user.setName("marco");
        user.setFavoriteNumbers(List.of(favNum));
        em.persist(user);

        em.getTransaction().commit();

        em.close();
    }
}
