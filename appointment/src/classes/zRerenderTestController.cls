public with sharing class zRerenderTestController {

    public String showInRerender {get;set;}
    public String showInRerenderModified;
    
    public String getShowInRerenderModified(){

          return showInRerenderModified;

     }

     public void doSomething (){

        showInRerenderModified = 'Here is what you just typed: ' + showInRerender;

    } 

}