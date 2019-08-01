/* SelectOption : 
 * 1. This is a pre-defined apex class 
 * 2. This is used to create Picklist option 
 * 3. Syntax : 
 *    SelectOption(itemValue,itemLabel)
 *    <apex:selectOption itemLabel="Hyd" itemValue="Hyd" />
 *     SelectOption op =new SelectOption('Hyd','Hyd');
 *     <apex:selectOption itemLabel="SFDC" itemValue="Salesforce" />
 *      SelectOption('Salesforce','SFDC')
 *      String s ='Ban';
 *      SelectOption(s,s);   itemLabel=Ban, ItemValue=Ban
 */
public class Map_30_Example_1 {
    public Map<String,List<String>> cityMap  {set;get;}
    public List<SelectOption> cities         {set;get;}
    public List<SelectOption> places         {set;get;}
    public String selected                   {set;get;}
    
    public Map_30_Example_1(){
        //1. Create a map with city Name as key and list of places as value
        cityMap = new Map<String,List<String>>();
        // 2. Initialize the cities and places 
        cities = new List<Selectoption>();
        places = new List<selectOption>();
        // 3. Create a list with places        
        List<String> hplaces = new List<String>{'SRNagar','LBNagar'};
        List<String> cplaces = new List<String>{'Thambaram','Chromepet'};
        // 4. insert the values into the map ,with city name Hyd as key and hplaces as value    
        cityMap.put('Hyd',hplaces);
        citymap.put('Che',cplaces); 
        // 5. fetch all the keys  (Hyd,Che)
        Set<String> keys = cityMap.keySet();  // Hyd, Che
        // 6. Create  the none option and add it to the cities and places 
        SelectOption n = new SelectOption('None','-None-');
        cities.add(n);
        places.add(n);
        // 7.take one by one key and create picklist option 
        for(String s:keys){                
            SelectOption op = new SelectOption(s,s); //itemValue=s itemLabel=s
            cities.add(op);
        }        
    }
    
    public void fetchPlaces(){
        // 1. Remove all the places from the places list
        places.clear();
        // 2. add none -option to the places
        SelectOption n = new SelectOption('None','-None-');
        places.add(n);
         // 3. If the selected city is not None then 
        if(selected!='None'){
            // if you pass the name of the city which we have selected then it will return corresponding places 
            List<String> myPlaces = cityMap.get(selected);
            for(String s:myPlaces){
                SelectOption p = new SelectOption(s,s);
                places.add(p); 
            }            
        }
    }
}