public virtual class Employee {
    // Common attributes for all employees
    public String name; // 4 bytes
    public String email; // 4 bytes
    public Decimal salary; // 8 bytes
    public Date JoiningDate; //4 bytes
    
    // OOPS - MEthod Overloading or Funciton loading
    // Constructor with 3 paramters
    public Employee(String name, String email, Decimal salary) {
        this.name = name;
        this.email = email;
        this.salary = salary;
    }
    
    // paramter less constructor or default constructor
    public Employee() {
        
    }
    
    public Employee(string strName) {
        
    }
    
    public Employee(Integer iEmployeeId) {
        
    }
    
    public string valueOf(date dInput)
    {
        return 'Converted date value string op';
    }
    
    public string valueOf(Decimal decInput)
    {
        return 'Converted decimal value inot string';
    }
    
    
    // Common method for all employees
    public virtual void showDetails() {
        System.debug('Name: ' + name);
        System.debug('Email: ' + email);
        System.debug('Salary: ' + salary);
    }
    
    // Applying OOPS Concept - MEthod Overloading
     public virtual void showDetails(string strName, string strEmail, String strSalary) {
        System.debug('Name: ' + strName);
        System.debug('Email: ' + strEmail);
        System.debug('Salary: ' + strSalary);
    }
    
    
    public virtual void EmployeeDetail()
    {
        System.debug('I work for HCL Tech');
        System.debug('Employee code is XYZ');
    }
    
    public string EmployeeJoiningDate(Date dtJoiningDate)
    {
        //dtJoiningDate is of type date but we have designed the function to return a string
        // Use APEX helper function to convert a date into string
        string strJoiningdate = String.valueof(dtJoiningDate);
        
        return strJoiningdate; 
    }
    
    
}