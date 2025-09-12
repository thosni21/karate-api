import com.intuit.karate.junit5.Karate;

public class FormationJoursTest {
   @Karate.Test
          // ===== 🟢 JOUR 1 - FONDAMENTAUX (7 heures) =====

    Karate jour1_matin_premiersPas() {
        // - Découvrir Karate
        return Karate.run("classpath:formation/jour1/01-premiers-pas.feature");
    }
    
    
    @Karate.Test
    Karate jour1_matin_assertionsTypes() {
        //  Types et assertions
        return Karate.run("classpath:formation/jour1/02-assertions-types.feature");
    }
    
    @Karate.Test
    Karate jour1_apresMidi_listesArrays() {
        //  Arrays et listes
        return Karate.run("classpath:formation/jour1/03-listes-et-arrays.feature");
    }




}