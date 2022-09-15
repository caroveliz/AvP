({
    
    doInit: function(component, event, helper) {
     var flow = component.find("flowData");
        var inputVariables = [
        {
            name : 'vAccountID',
            type : 'String',
            value : component.get('v.recordId') 
        },
        {
            name : 'vUserID',
            type : 'String',
            value : $A.get("$SObjectType.CurrentUser.Id")
        }
        ];
        console.log('input variable==='+ JSON.stringify(inputVariables));
        flow.startFlow("Direct_Book_V3", inputVariables);
   },
	statusChange : function (cmp, event) {
        if (event.getParam('status') === "FINISHED") {
       	 $A.get("e.force:closeQuickAction").fire();
        }
    }   
  })