@isTest
public class ParkLocatorTest {
@isTest static void testMock(){
        test.setMock(WebserviceMock.class, new ParkServiceMock());
        String[] parksName = ParkLocator.Country('India');
        List<String> country = new List<String>();
               	country.add('Inamdar National Park');
                country.add('Riza National Park');
                country.add('Shilpa National Park');
        System.assertEquals(country, parksName, 'park names are not as expected');
    }

}