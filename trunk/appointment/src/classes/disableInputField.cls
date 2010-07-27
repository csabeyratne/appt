public class disableInputField {

    public Opportunity opp {get; set;}
    public Boolean disableInput {get; set;}
    
    public disableInputField(){
        opp = new Opportunity();
    }
    
    public void disableCloseDateInput(){
        disableInput = true;
    }
    
    public void enableCloseDateInput(){
        disableInput = false;
    }

     //-------------Test Method-----------------
    static testMethod void doTest(){
        disableInputField controller = new disableInputField();
        
        controller.disableCloseDateInput();
        system.assert(controller.disableInput == true);
        
        controller.enableCloseDateInput();
        system.assert(controller.disableInput == false);
    }
}