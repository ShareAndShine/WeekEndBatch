public with sharing class Month {
    
    // paramterless or default constructor
    public Month() {

    }

    // properties to hold data like month name ,  year, total number of days, total number of weekends, and total number of the days
    public String monthName;
    public Integer year;
    public Integer totalWeekEnds;
    public Integer totalOftotalDays;

    // constructor (parameterized)
    public Month(String strmonthName , Integer iYear, Integer itotalWeekEnds, Integer itotalOftotalDays) {
        this.monthName = strmonthName;
        this.year = iYear;
        this.totalWeekEnds = itotalWeekEnds;
        this.totalOftotalDays = itotalOftotalDays;
    }
    
}