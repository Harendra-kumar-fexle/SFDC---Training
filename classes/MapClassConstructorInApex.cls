public with sharing class MapClassConstructorInApex {
    String matchingKey;
    String nameOfCountry;
    Integer districtSize;
    
    static Map<String, Map<String, List<String>>> countryMapWithStates = new Map<String, Map<String, List<String>>>();
    
    Public MapClassConstructorInApex(String matchingKey, String nameOfCountry, Integer districtSize){
        
        this.matchingKey = matchingKey;
        this.nameOfCountry = nameOfCountry;
        this.districtSize = districtSize;
        
        List<District__c> listOfDistrict = [SELECT Id, Name, State_Name__r.Country_Name__r.Id, State_Name__r.Country_Name__r.Name,
                                            State_Name__r.Id, State_Name__r.Name FROM District__c];
        for(District__c dis : listOfDistrict)
        {  
            if(!countryMapWithStates.containsKey(dis.State_Name__r.Country_Name__r.Name))
                countryMapWithStates.put(dis.State_Name__r.Country_Name__r.Name , new Map<String, List<String>>());
            if(!countryMapWithStates.get(dis.State_Name__r.Country_Name__r.Name).containsKey(dis.State_Name__r.Name))
                countryMapWithStates.get(dis.State_Name__r.Country_Name__r.Name).put(dis.State_Name__r.Name, new List<String>());
            if(!countryMapWithStates.get(dis.State_Name__r.Country_Name__r.Name).get(dis.State_Name__r.Name).contains(dis.Name))
                countryMapWithStates.get(dis.State_Name__r.Country_Name__r.Name).get(dis.State_Name__r.Name).add(dis.Name);
        }
        
        System.debug('countryMapWithStates--> '+countryMapWithStates);
        if(matchingKey != null)
            findMachingKey(matchingKey , districtSize);
        
        totalStateAndDistrict();
        
        if(nameOfCountry != null)
            countryJSONGenerator(nameOfCountry);
    }
    //Find combination of country state and Districts
    public static void findMachingKey(String matchingKey, Integer districtSize){
        for(String countryName : countryMapWithStates.keySet())
        {
            if(countryName.startsWith(matchingKey))
            {
                for(String stateName : countryMapWithStates.get(countryName).keySet()){
                    if(stateName.startswith(matchingKey))
                    {
                        for(String districtName : countryMapWithStates.get(countryName).get(stateName)){
                            if(districtName.startsWith(matchingKey)){
                                System.debug('matchingKey - Country : '+countryName+', State : '+stateName+ ', District : '+districtName);
                            }
                        }
                    }
                }    
            }  
        }
    }
        //Find Total number of State and District using Aggregate Query
        public static void totalStateAndDistrict() {
            List<State__c> listOfStateDistrictToUpdate = new List<State__c>();
            List<Country__c> listOfStateInCountryToUpdate = new List<Country__c>();
            List<Country__c> listOfDistrictInCountryToUpdate = new List<Country__c>();
            
            //Find total number of districts for state
            AggregateResult[] districtAggregateResultForState = [Select Count(Id) Total_District, State_Name__c From District__c GROUP BY State_Name__c];
            for(AggregateResult ar : districtAggregateResultForState) {
                State__c state = new State__c();
                state.Id = (Id)ar.get('State_Name__c');
                state.Total_District__c = (Integer)ar.get('Total_District');
                listOfStateDistrictToUpdate.add(state);
            }
            if(!listOfStateDistrictToUpdate.isEmpty())
                update listOfStateDistrictToUpdate;
            
            //Find total number of state for country
            AggregateResult[] stateAggregateResultForCountry = [Select Count(Id) Total_State, Country_Name__c From State__c GROUP BY Country_Name__c];
            for(AggregateResult ar : stateAggregateResultForCountry) {
                Country__c country = new Country__c();
                country.Id = (Id)ar.get('Country_Name__c');
                country.All_states__c = (Integer)ar.get('Total_State');
                listOfStateInCountryToUpdate.add(country);
            }
            if(!listOfStateInCountryToUpdate.isEmpty())
                update listOfStateInCountryToUpdate;
            
            //Find total number of district for country
            AggregateResult[] districtAggregateResultForCountry = [Select Count(Id) Total_District, State_Name__r.Country_Name__c From District__c GROUP BY State_Name__r.Country_Name__c];
            for(AggregateResult ar : districtAggregateResultForCountry) {
                Country__c country = new Country__c();
                country.Id = (Id)ar.get('Country_Name__c');
                country.Total_Districts__c = (Integer)ar.get('Total_District');
                listOfDistrictInCountryToUpdate.add(country);
            }
            if(!listOfDistrictInCountryToUpdate.isEmpty())
                update listOfDistrictInCountryToUpdate;
        }
        
        public static void countryJSONGenerator(String nameOfCountry){
            
            List<Country__c> countryList = [SELECT Id, Name, Total_Districts__c, All_states__c, Country_Code__c, 
                                           (SELECT Id, Name, Total_District__c FROM States__r )
                                           FROM Country__c WHERE Name =: nameOfCountry];
            System.debug(countryList);
            
            if(!countryList.isEmpty())
            {
                Country con = new Country();
               	con.countryName = countryList[0].Name;
                con.countryCode = countryList[0].Country_Code__c;
                con.states = new List<States>();
                con.Total_Districts = (Integer)countryList[0].Total_Districts__c;
                con.Total_States = (Integer)countryList[0].All_states__c;
                
                System.debug('Con-->'+ con);
                
                if(!countryList[0].States__r.isEmpty())
                {
                    for(State__c st : countryList[0].States__r)
                    {
                        States wrapState = new States();
                        wrapState.stateName = st.Name;
                      	wrapState.districts = new List<Districts>();
                        wrapState.Total_Districts = (Integer)st.Total_District__c;
                        
                        System.debug('wrapState--> '+ wrapState);
                        
                        System.debug(countryMapWithStates.get(nameOfCountry).get(st.Name));
                        
                        if(countryMapWithStates.get(nameOfCountry).containsKey(st.Name))
                            for(String dt : countryMapWithStates.get(nameOfCountry).get(st.Name))
                            {
                                Districts wrapDistrict = new Districts();
                                wrapDistrict.districtName = dt;
                                wrapState.districts.add(wrapDistrict);
                            }
                        con.states.add(wrapState);         
                    }
                }
                String jString = JSON.serialize(con);
                System.debug(jString); 
                countryList[0].JSON_Data__c = jString;
                update countryList;
            }
        }
        
        public List<Country> countryList{get; set;}
        public class Country{
            public String countryName{get; set;}
            public String countryCode{get; set;}
            public Integer Total_States{get; set;}
            public Integer Total_Districts{get; set;}
            public List<States> states{get; set;}       
        }
        public class States{
            Public string stateName{get; set;}
            Public List<Districts> districts{get; set;}
            public Integer Total_Districts{get; set;}
        }
        public class Districts{
            Public String districtName{get; set;}
        }
    }