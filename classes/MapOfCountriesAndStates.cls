public with sharing class MapOfCountriesAndStates {
    Map<String, Map<String, Map<String, List<String>>>> mapOfCountries = new Map<String, Map<String,Map<String, List<String>>>>();

    //Constructor
    public mapOfCountriesAndStates() {
    
         //Map of Sri Lanka
         Map<String, List<String>> mapOfStateWithCityOfSriLanka = new Map<String, List<String>>();
         mapOfStateWithCityOfSriLanka.put('Anuradha Pura', new List<String> {'Anuradhapura East Electoral District', 'Mihintale Electoral District', 'Kekirawa Electoral District', 'Horowpothana Electoral District'});
         mapOfStateWithCityOfSriLanka.put('Badulla', new List<String> {'Bogoda Wooden Bridge', 'Army Garrison Town', 'Namunukula Mountain Range', 'Indigenous Vedda people, Dambana'});
         mapOfStateWithCityOfSriLanka.put('Colombo', new List<String> {'Mattakkuliya', 'Lunupokuna', 'Mahawatte', 'Modera'});
         mapOfStateWithCityOfSriLanka.put('SKandy', new List<String> {'Poojapitiya', 'SThumpane', 'Udapalatha', 'Ududumbara'});
            
         Map<String, Map<String, List<String>>> mapOfCountryWithStateOfSriLanka = new Map<String, Map<String, List<String>>>();
         mapOfCountryWithStateOfSriLanka.put('Sri Lanka', mapOfStateWithCityOfSriLanka);
            
            
            

         //Map of India
         Map<String, List<String>> mapOfStateWithCityOfIndia = new Map<String, List<String>>();
         mapOfStateWithCityOfIndia.put('Rajasthan', new List<String> {'Jaipur', 'Ajmer', 'Sikar', 'Bharatpur', 'Kota'});
         mapOfStateWithCityOfIndia.put('Uttar Pradesh', new List<String> {'Mathura', 'Kanpur', 'Gorakhpur', 'Hathras', 'Lucknow'});
         mapOfStateWithCityOfIndia.put('Maharashtra', new List<String> {'Ahmednagar', 'Akola', 'Aurangabad', 'Kohlapur', 'Chandrapur'});
         mapOfStateWithCityOfIndia.put('Uttarakhand', new List<String> {'Chamoli', 'Bageshwar', 'Haridwar', 'Pithoragarh', 'Uttarkashi'});
         
         Map<String, Map<String, List<String>>> mapOfCountryWithStateOfIndia = new Map<String, Map<String, List<String>>>();
         mapOfCountryWithStateOfIndia.put('India', mapOfStateWithCityOfIndia);
         
         
         //Map of US
         Map<String, List<String>> mapOfStateWithCityOfUS = new Map<String, List<String>>();
         mapOfStateWithCityOfUS.put('South Dakota', new List<String> {'Grant-Deuel School District', 'Gregory School District', 'Greater Hoyt School District', 'Gettysburg School District'});
         mapOfStateWithCityOfUS.put('Colorado', new List<String> {'Big Sandy School District 100J', 'Creede School District', 'Monte Vista School District C-8', 'Hathras', 'Swink School District 33'});
         mapOfStateWithCityOfUS.put('Alaska', new List<String> {'Anchorage', 'Southeast Fairbanks Census Area', 'Nome Census Area', 'Sitka Borough'});
         mapOfStateWithCityOfUS.put('Florida', new List<String> {'Trinidad School District 1', 'Citrus County Schools', 'Sarasota County Schools', 'Gulf County Schools'});
         
         Map<String,Map<String, List<String>>> mapOfCountryWithStateOfUS = new Map<String,Map<String, List<String>>>();
         mapOfCountryWithStateOfUS.put('United States of America', mapOfStateWithCityOfUS);

         mapOfCountries.put('IND', mapOfCountryWithStateOfIndia);
         mapOfCountries.put('USA', mapOfCountryWithStateOfUS);
         mapOfCountries.put('LKA', mapOfCountryWithStateOfSriLanka);
         
          // Printf Whole Map.
         System.debug('mapOfCountries: ' + mapOfCountries);
    }

    public void findCityNamesOfSpecificLength() {
                for(String countryCode : mapOfCountries.keySet()) {
                    for(String countryName : mapOfCountries.get(countryCode).keySet()) {
                        for(String stateName : mapOfCountries.get(countryCode).get(countryName).keySet()) {
                            for(String cityName : mapOfCountries.get(countryCode).get(countryName).get(stateName)) {
                                if(cityName.length()>=9) {
                                System.debug('Districts length greaterthan 9 -> '+ cityName);
                        }
                    }
                }
            }
        }
    }  
    
    List<String> listOfCountries = new List<String>();
    List<String> listOfStates = new List<String>();
    List<String> listOfCities = new List<String>();

    public void findCombinationNameStartWithS() {
        for(String countryCode : mapOfCountries.keySet()) {
            for(String countryName : mapOfCountries.get(countryCode).keySet()) {
                if(countryName.charAt(0) == 83) {
                    listOfCountries.add(countryName);
                    for(String stateName : mapOfCountries.get(countryCode).get(countryName).keySet()) {
                        if(stateName.charAt(0) == 83) {
                            listOfStates.add(stateName);
                        }
                        for(String cityName : mapOfCountries.get(countryCode).get(countryName).get(stateName)) {
                            if(cityName.charAt(0) == 83) {
                                listOfCities.add(cityName);
                            }
                        }
                    }
                }
            }
        }
        System.debug('List of country start with S -> ' + listOfCountries);
        System.debug('List of states start with S -> ' + listOfStates);
        System.debug('List of city start with S -> ' + listOfCities);
    }
}