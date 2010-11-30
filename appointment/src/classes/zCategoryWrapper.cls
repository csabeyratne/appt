public class zCategoryWrapper {

    public Boolean checked{ get; set; }
    public zCat3__c cat { get; set;}

    public zCategoryWrapper(){
        cat = new zCat3__c();
        checked = false;
    }

    public zCategoryWrapper(zCat3__c c){
        cat = c;
        checked = false;
    }

    public static testMethod void testMe() {

        zCategoryWrapper cw = new zCategoryWrapper();
        System.assertEquals(cw.checked,false);      

        zCategoryWrapper cw2 = new zCategoryWrapper(new zCat3__c(name__c='Test1'));
        System.assertEquals(cw2.cat.name__c,'Test1');
        System.assertEquals(cw2.checked,false);     

    }

}