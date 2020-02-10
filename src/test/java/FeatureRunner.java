import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
//        return new Karate().feature("data_driven.feature").relativeTo(getClass());
        return new Karate().tags("@smoke1").relativeTo(getClass());
    }

}
