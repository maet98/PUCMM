# Mahout

## Miguel Estevez

## 20170200

### SQL script

```sql
CREATE TABLE user_preferences (
    user_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    preference FLOAT NOT NULL,
    PRIMARY KEY (user_id, book_id),
    INDEX (user_id),
    INDEX (book_id)
);

INSERT INTO user_preferences VALUES(1,3,3);
INSERT INTO user_preferences VALUES(1,4,3);
INSERT INTO user_preferences VALUES(1,5,1);
INSERT INTO user_preferences VALUES(1,6,4);
INSERT INTO user_preferences VALUES(1,8,2);
INSERT INTO user_preferences VALUES(2,0,3);
INSERT INTO user_preferences VALUES(2,1,3);
INSERT INTO user_preferences VALUES(2,4,2);
INSERT INTO user_preferences VALUES(2,7,1);
INSERT INTO user_preferences VALUES(2,8,1);
INSERT INTO user_preferences VALUES(3,1,3);
INSERT INTO user_preferences VALUES(3,2,3);
INSERT INTO user_preferences VALUES(3,3,4);
INSERT INTO user_preferences VALUES(3,5,3);
INSERT INTO user_preferences VALUES(3,8,1);
INSERT INTO user_preferences VALUES(4,0,3);
INSERT INTO user_preferences VALUES(4,1,4);
INSERT INTO user_preferences VALUES(4,2,3);
INSERT INTO user_preferences VALUES(4,5,4);
INSERT INTO user_preferences VALUES(4,7,3);
INSERT INTO user_preferences VALUES(4,10,5);
INSERT INTO user_preferences VALUES(5,1,3);
INSERT INTO user_preferences VALUES(5,2,5);
INSERT INTO user_preferences VALUES(5,6,1);
INSERT INTO user_preferences VALUES(5,7,1);
INSERT INTO user_preferences VALUES(6,1,1);
INSERT INTO user_preferences VALUES(6,2,2);
INSERT INTO user_preferences VALUES(6,3,3);
INSERT INTO user_preferences VALUES(6,4,5);
INSERT INTO user_preferences VALUES(6,7,1);
INSERT INTO user_preferences VALUES(6,9,3);
INSERT INTO user_preferences VALUES(6,10,1);
INSERT INTO user_preferences VALUES(7,1,2);

INSERT INTO user_preferences  VALUES(7,7,1); 
INSERT INTO user_preferences VALUES(7,9,3);
INSERT INTO user_preferences VALUES(7,10,5);
INSERT INTO user_preferences VALUES(8,0,1);
INSERT INTO user_preferences VALUES(8,1,1);
INSERT INTO user_preferences VALUES(8,5,3);
INSERT INTO user_preferences VALUES(8,6,3);
INSERT INTO user_preferences VALUES(8,7,5);
INSERT INTO user_preferences VALUES(8,8,1);
INSERT INTO user_preferences VALUES(9,0,2);
INSERT INTO user_preferences VALUES(9,1,1);
INSERT INTO user_preferences VALUES(9,4,5);
INSERT INTO user_preferences VALUES(9,6,1);
INSERT INTO user_preferences VALUES(9,7,1);
INSERT INTO  user_preferences VALUES(9,8,5);
INSERT INTO  user_preferences VALUES(9,9,3);
INSERT INTO  user_preferences VALUES(10,0,2);
INSERT INTO  user_preferences VALUES(10,1,3);
INSERT INTO  user_preferences VALUES(10,2,1);
INSERT INTO  user_preferences VALUES(10,4,2);
INSERT INTO  user_preferences VALUES(10,6,3);
INSERT INTO  user_preferences VALUES(11,1,2);
INSERT INTO  user_preferences VALUES(11,2,2);
INSERT INTO  user_preferences VALUES(11,4,1);
INSERT INTO  user_preferences VALUES(11,5,3);
INSERT INTO  user_preferences VALUES(11,7,5);
INSERT INTO  user_preferences VALUES(12,0,1);
INSERT INTO  user_preferences VALUES(12,2,2);
INSERT INTO  user_preferences VALUES(12,3,5);
INSERT INTO  user_preferences VALUES(12,7,2);
INSERT INTO  user_preferences VALUES(12,8,2);
INSERT INTO  user_preferences VALUES(12,10,3);
INSERT INTO  user_preferences VALUES(13,1,2);
INSERT INTO  user_preferences VALUES(13,2,3);
INSERT INTO  user_preferences VALUES(13,3,3);
INSERT INTO  user_preferences VALUES(13,5,1);
INSERT INTO  user_preferences VALUES(13,7,5);
INSERT INTO  user_preferences VALUES(13,8,2);
INSERT INTO  user_preferences VALUES(14,2,2);
INSERT INTO  user_preferences VALUES(14,5,3);
INSERT INTO  user_preferences VALUES(14,6,1);
INSERT INTO  user_preferences VALUES(14,7,1);
INSERT INTO  user_preferences VALUES(14,8,4);
INSERT INTO  user_preferences VALUES(15,4,5);
INSERT INTO  user_preferences VALUES(15,5,1);
INSERT INTO  user_preferences VALUES(15,7,5);
INSERT INTO  user_preferences VALUES(15,8,1);
INSERT INTO  user_preferences VALUES(15,9,3);
INSERT INTO  user_preferences VALUES(15,10,4);
INSERT INTO  user_preferences VALUES(16,1,5);
INSERT INTO  user_preferences VALUES(16,2,5);
INSERT INTO  user_preferences VALUES(16,5,3);
 
INSERT INTO user_preferences VALUES(16,7,3);
INSERT INTO user_preferences VALUES(16,10,3);
INSERT INTO user_preferences VALUES(17,0,1);
INSERT INTO user_preferences VALUES(17,1,2);
INSERT INTO user_preferences VALUES(17,2,1);
INSERT INTO user_preferences VALUES(17,4,3);
INSERT INTO user_preferences VALUES(17,5,2);
INSERT INTO user_preferences VALUES(17,8,2);
INSERT INTO user_preferences VALUES(18,1,1);
INSERT INTO user_preferences VALUES(18,2,1);
INSERT INTO user_preferences VALUES(18,5,3);
INSERT INTO user_preferences VALUES(18,7,4);
INSERT INTO user_preferences VALUES(18,8,2);
INSERT INTO user_preferences VALUES(18,10,3);
INSERT INTO user_preferences VALUES(19,0,1);
INSERT INTO user_preferences VALUES(19,1,3);
INSERT INTO user_preferences VALUES(19,5,1);
INSERT INTO user_preferences VALUES(19,7,5);
INSERT INTO user_preferences VALUES(20,5,5);
INSERT INTO user_preferences VALUES(20,6,1);
INSERT INTO user_preferences VALUES(20,8,2);
INSERT INTO user_preferences VALUES(20,9,4);

```





### Implementation

```java
/**
 * 
 */
package Main;

/**
 * @author hadoop1
 *
 */

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import java.util.List;


public class MySQLRecommender {
 private static final String SERVER_NAME = "localhost";
 private static final String USER_NAME = "root";
 private static final String PASSWORD = "example";
 private static final String DATABASE = "mahout";
 private static String[] books = { "Meet Big Brother",
  "Explore the Universe", "Memoir as metafiction",
  "A child-soldier's story", "Wicked good fun",
  "The 60s kids classic", "A short-form master",
  "Go down the rabbit hole", "Unseated a president",
  "An Irish-American Memoir","PARASITE"};
 private static final int NEIGHBOR_HOOD_SIZE = 5;
 /**
  * Get Recommender instance using database
  *
  * @return
  * @throws Exception
  */
 public static Recommender getRecommender() throws Exception {
  MysqlDataSource dataSource = new MysqlDataSource();
  dataSource.setServerName(SERVER_NAME);
  dataSource.setUser(USER_NAME);
  dataSource.setPassword(PASSWORD);
  dataSource.setDatabaseName(DATABASE);
  DataModel model = new MySQLJDBCDataModel(dataSource,
  "user_preferences", "user_id", "book_id", "preference", null);
  /* Get Pearson correlation instance from given model */
  UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
  /*
  * Computes a neighborhood consisting of the nearest n users to a given
  * user.
  */
  UserNeighborhood neighborhood = new NearestNUserNeighborhood(
  NEIGHBOR_HOOD_SIZE, similarity, model);
  /* Get Recommender */
  Recommender recommender = new GenericUserBasedRecommender(model,
  neighborhood, similarity);
  return recommender;
 }
 public static List<RecommendedItem> getRecommendations(
  Recommender recommender, int custId, int noOfRecommendations)


  throws Exception {

  return recommender.recommend(custId, noOfRecommendations);
 }
 public static void displayRecommendations(int custId,
  List<RecommendedItem> recommendations) {
  System.out.println("Recommendations for customer " + custId + " are:");
  System.out.println("*************************************************");
  for (RecommendedItem recommendation : recommendations) {
  int bookId = (int) recommendation.getItemID();
  System.out.println(bookId + " " + books[bookId]);
  }
  System.out.println("*************************************************");
}

public static void main(String args[]) throws Exception {
          Recommender recommender = getRecommender();
          List<RecommendedItem> recommendations;
          recommendations = getRecommendations(recommender, 1, 2);
          displayRecommendations(1, recommendations);
          recommendations = getRecommendations(recommender, 2, 5);
          displayRecommendations(2, recommendations);
          recommendations = getRecommendations(recommender, 3, 4);
          displayRecommendations(3, recommendations);
     }
}

```



### Output

---

![](/home/miguel/Repository/PUCMM/Semestre8/DBII/mahout.png)



### Reflexion

---

Los sistemas de recomendacion son una clase muy importante de algoritmos de machine learning ya que ofrecen recomendaciones "relevantes" a los usuarios. Esto son usado en las mayorias de applicaciones en la actualidad para mantener a sus usuarios. Un ejemplo simple, es youtube que solo te recomienda videos relacionado a algo que has visto.



En nuestro caso, se esa haciendo uso de mahout el cual hace un gran uso de los paradigma de map y reduce, para recomendar peliculas a los usuarios basado en una base de datos que se le fue proporcionada. Pudo hacer recomendaciones personalizadas a cada uno de los usuarios.



Este tipo de algoritmo es un tanto interesante ya que hace un gran uso de la algebra lineal para poder sacar estas recomendaciones. Ademas de los muchos casos de usos en que este algoritmo es usado. Hace que sea una herramienta relevante a la hora de hacer algun proyecto, que busque atrapar a los usuarios.