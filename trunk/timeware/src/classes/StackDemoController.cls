public class StackDemoController {
    StringStack s;
    
    public StackDemoController(){
        s = new StringStack(); 
    }
    
    public String pushValue {get; set;}
    public String popValue {get; set;}
    
    public void push(){
        try{
            s.push(pushValue);
            pushValue = '';
            popValue = '';
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);
        }
    }
    
    public void pop(){
        try{
            popValue = s.pop();
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);
        }
    }
    
    public List<String> getStack(){
        List<String> strings = new List<String>();
        
        while(!s.isEmpty()){    
            String temp = s.pop();
            strings.add(temp);
        }

        for (String str : strings){
            s.push(str);            
        }
        
        return strings;
    }
    
     public static testMethod void testMyController() {
        // 1. Set up all conditions for testing
        String apple = 'Apple';
        
        PageReference p = Page.StackDemo;
        Test.setCurrentPage(p);
        StackDemoController con = new StackDemoController();
        
        // 2. Call the method(s) being tested.
        con.PushValue = apple;
        con.push();
        List<String> stack = con.getStack();
        
        // 3. Verify the results are correct.
        System.assertEquals(apple, stack[0]);
        
        con.pop();
        String popValue = con.PopValue;
        System.assertEquals(apple, popValue);
     }
}