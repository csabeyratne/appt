public class ListviewController {

  private Console_View__c oConsoleView;

  public listviewController () {
    String sUserId = UserInfo.getUserId();
    String sTab = ApexPages.currentPage().getParameters().get('tab');
    Console_View__c[] oConsoleViews = new Console_View__c[0];
    oConsoleViews = [
      SELECT
        Id,
        Tab__c,
        User__c,
        List_1_Id__c,
        List_2_Id__c,
        List_3_Id__c,
        List_4_Id__c,
        List_5_Id__c
      FROM Console_View__c
      WHERE User__c = :sUserId
      AND Tab__c = :sTab
    ];

    if (oConsoleViews.Size() == 1)
      oConsoleView = oConsoleViews[0];
    else
      oConsoleView = new Console_View__c();
  }

  public Console_View__c getConsoleView() {
    return this.oConsoleView;
  }

  //List 1
  public String getList1Id() {
    return this.oConsoleView.List_1_Id__c;
  }

  public Boolean getList1Render() {
    if (oConsoleView.List_1_Id__c != null)
      return true;
    else
      return false;
  }

  //List 2
  public String getList2Id() {
    return this.oConsoleView.List_2_Id__c;
  }

  public Boolean getList2Render() {
    if (oConsoleView.List_2_Id__c != null)
      return true;
    else
      return false;
  }

  //List 3
  public String getList3Id() {
    return this.oConsoleView.List_3_Id__c;
  }

  public Boolean getList3Render() {
    if (oConsoleView.List_3_Id__c != null)
      return true;
    else
      return false;
  }

  //List 4
  public String getList4Id() {
    return this.oConsoleView.List_4_Id__c;
  }

  public Boolean getList4Render() {
    if (oConsoleView.List_4_Id__c != null)
      return true;
    else
      return false;
  }

  //List 5
  public String getList5Id() {
    return this.oConsoleView.List_5_Id__c;
  }

  public Boolean getList5Render() {
    if (oConsoleView.List_5_Id__c != null)
      return true;
    else
      return false;
  }

  //Test methods
  static testMethod void testListviewController()
  {
    ListviewController oLVC = new ListviewController();
    oLVC.getList1Id();
    oLVC.getList2Id();
    oLVC.getList3Id();
    oLVC.getList4Id();
    oLVC.getList5Id();

    oLVC.getList1Render();
    oLVC.getList2Render();
    oLVC.getList3Render();
    oLVC.getList4Render();
    oLVC.getList5Render();
  }
}