public interface ExternalSystemConnector {
    
    void Connect(String EndPointAPIURL); // method to establish connection between the systems
    void DisConnect(String EndPointAPIURL); // method to disconnect connection between the systems
    void SendData(List<SObject> lstData); // method to send data
    void ReceiveData(String jsonData); // method to receive data
    void LogErrors(String szErrorData);
}




