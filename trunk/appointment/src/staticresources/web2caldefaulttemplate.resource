//this function includes all necessary js files for the application
function include(file)
{

  var script  = document.createElement('script');
  script.src  = file;
  script.type = 'text/javascript';
  script.defer = true;

  document.getElementsByTagName('head').item(0).appendChild(script);

}

/* any js files included here */

//include('http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js');


		Web2Cal.defaultPlugins=function()
		{
		}
		//called from basicCalendar.page wsOnNewEvent()
		Web2Cal.defaultPlugins.WSNewEvent = function(eventObject, groups, isgroupEvent, Users)
		{
		  var st = eventObject.startTime;
		  var ed = eventObject.startTime;
		  var newWS =  jQuery("#newWorkshiftTemplate");
		  newWS.find("#formattedStartTime").val( st).end()
		  .find("#formattedEndTime").val(ed).end();
		}
		
		
 		// called from Calendar.page onNewEvent()
		Web2Cal.defaultPlugins.onNewEvent=function(obj, groups, allday, usersAndIds, currentUserId, GLOBALsubgroupArray)
		{	
			var st=new UTC(obj.startTime);
			var ed = new UTC(obj.endTime); 
			var newevt=jQuery("#defaultNewEventTemplate");
			newevt.find("#recursiveEvent").find("#recursionContainer").hide().end()
				.find("#eventDesc").val("").focus().end()
				.find("#eventName").val("").focus().end()
				.find("#startDate").val( st.toJustDateString()).end()
				
				.find("#dfltPlgnrecurrenceStartLabel").html(st.toStandardFormat()).end()
				.find("#recurrenceMonthRuleOnTheNthDay").html(ed.getDate() + " of Month" ).end()
				.find(".recurrenceWeeklyDay").attr("checked",false).end()
				.find("#recurrenceWeeklyDay"+(st.getDay()+1)).attr("checked",true).end();

			 
		 	jQuery("#eventEndDate").val(ed.toStandardFormat()).end();
		 	jQuery("#eventStartDate").val(st.toStandardFormat()).end();
		 
		  /*******************USER LIST***********************/
      		var UserList = newevt.find("#eventUser").get(0);
      		removeAllOptions(UserList);
      		for (var uai=0;uai<usersAndIds.length;uai++)
      		{
        		addOption(UserList, usersAndIds[uai][0], usersAndIds[uai][1], false);
      		}
      
      		newevt.find("#eventUser").val(currentUserId);
		 	/*******************ADDED BY G***********************/
		 	jQuery('#eventStartDate').datepicker();
     		jQuery('#eventEndDate').datepicker();
		 
		 	var timeSelect = new Web2Cal.TimeControl(document.getElementById("eventStartTime"));
     		jQuery('#ssTimeControleventStartTime').addClass('changeZIndex');
    
     		var timeSelect = new Web2Cal.TimeControl(document.getElementById("eventEndTime"));
     		jQuery('#ssTimeControleventEndTime').addClass('changeZIndex');
     		/**********************END****************************/
     
     		/*****************SUBGROUPS**************************/
			var recEventChk=newevt.find("#recursiveEvent").get(0);
			if(recEventChk)
			{
					recEventChk.checked=false;
			}

			newevt.find("#eventStartTime").val(st.toNiceTime());
			newevt.find("#eventEndTime").val(ed.toNiceTime());							


	    	newevt.find("#eventSubGroup").val(obj.personName);
	    	newevt.find("#eventSubID").val(obj.personId);
	  		for (var uai2=0;uai2<GLOBALsubgroupArray.length;uai2++)
      		{
      			if (GLOBALsubgroupArray[uai2][0] == obj.personName)
	    			newevt.find("#resourceDesc").val(GLOBALsubgroupArray[uai2][2]);
	    	}
	    	newevt.find("#eventGroup").val(obj.group.groupId);  
			}
		

		// create a new event here
		Web2Cal.defaultPlugins.getNewEventObject=function()
		{
			var newEventContainer  = jQuery("#defaultNewEventTemplate"); 
			var user               = newEventContainer.find("#eventUser").val();
			var subPerson          = newEventContainer.find("#eventSubGroup").val();
			var subId              = newEventContainer.find("#eventSubID").val();;
      		var group              = newEventContainer.find("#eventGroup").val();
			var strtTime           = newEventContainer.find("#eventStartTime").val();
			var endTime            = newEventContainer.find("#eventEndTime").val();
			var startDate          = newEventContainer.find("#eventStartDate").val();
			var endDate            = newEventContainer.find("#eventEndDate").val();
      		var desc               = newEventContainer.find("#resourceDesc").val(); 
      		var evtDesc            = newEventContainer.find("#newEventDesc").val();

			var newev={user:user, subPerson:subPerson, subId:subId, group:group, startDate:startDate, endDate:endDate, strtTime:strtTime, endTime:endTime, desc:desc, evtDesc:evtDesc};
			
			return newev;

		}



		Web2Cal.defaultPlugins.load=function(opts)
		{
			var options = opts || new Array();
			var createWeekEventTemplate=function()
			{
				var _html='<div class="calendarTemplate"  id="dayWeekEventTemplate" style="display:none;"> '
							+''
							+' <div class="header" style="">'
							+' 	${formattedStartTime} - ${formattedEndTime}'
							+' </div>	'
							+' <div class="body"  style="padding:1px;">'
							+' 	${eventName}'
							+' </div> '
							+''
						+' </div>';
				return _html;
			}
			var createRecurEventOptions=function()
			{
				var _html='	'
						+'<div id="editRecurEventOptions"> '
						+'	<P>'
						//+'		Would you like to change only this event or all events in the series?'
						+Web2Cal.LANG.LABEL_EDIT_RECUR_EVENT_DESC
						+'	</P>'
						+'	<input type="button" tabindex="1" class="button" value="Only this instance" id="recurEvent_SAVEONE" />'
						+'	<input type="button" tabindex="2" class="button" value="All events in the series" id="recurEvent_SAVEALL" />'
						//+'	<input type="button" tabindex="3" class="button" value="All following" id="recurEvent_SAVEFOLLOWING" />'
						+'	<input type="button" tabindex="4" class="button" value="Cancel" id="recurEvent_CANCEL" />'
						+'</div>';
				return _html;
			}
			var createWeekSlotTemplate= function(eventId)
			{
				var _html='<div class="calendarTemplate"  id="wsSlotTemplate" style="display:none;"> '
							+'		<div>'
							+'			${name} ' 
							+'		</div>'
							+'	</div>';
				return _html;
			}
			var createMonthEventTemplate=function()
			{
				var _html='<div class="calendarTemplate"  id="monthEventTemplate" style="display:none;"> '
						+'			<div  style="">'
						+'					${formattedStartTime} - ${formattedEndTime}'
						+'			</div>	'
						+'	</div>';
				return _html;
			}
			
			
			var createWorkshiftTemplate=function()
			{
				
				var _html = '<div class="calendarTemplate"  id="workshiftEventTemplate" style="display:none;"> '
								+'<div class="header" style="">'
								+'	${formattedStartTime} - ${formattedEndTime}'
								+'</div>	'
								+'<div class="body"  style="padding:1px;">'
								+'	${eventName}   '
								+'</div> '
							+'</div>';
				return _html;
			}
			
			
      
      
			var createDefaultPreview = function() 
			{
				var _html='<style>.changeZIndex{z-index: 1000 !important;}</style>'
				    +'    <div id="previewTemplate"  class="calendarTemplate fullPreviewTemplate " style="display:none">'
					//+'		<div class="aPointer p-left" style="display: block; z-index: 0;  "></div>'
					+'		<div id="ds-right" class="dshadow ds-right"></div>'
					+'		<div id="ds-bottom" class="dshadow ds-bottom"></div>'
					+'		<div id="ds-corner" class="dshadow ds-corner"></div>' 
					+'		<div class="header">'
					+'			${personName}'
					+'		</div>'
					+'		<table width="100%">'
					+'			<tr> '
					+'      <td>User:</td><td><select disabled = "true"><option value="${eventName}">${eventName}</option></select></td>'
          +'      </tr><tr>'
          +'    <td>Start:</td><td>${_startTime.getMonth()}/${_startTime.getDate()}/${_startTime.getFullYear()} ${formattedStartTime}<br/></td>'
          +'      </tr><tr>'
          +'      <td>End:</td><td>${_endTime.getMonth()}/${_endTime.getDate()}/${_endTime.getFullYear()} ${formattedEndTime}</td> '   
          +'      </tr><tr>'
          +'      <td>Event Description:</td><td> <textarea  class="inputbox" rows="1" cols="20" name="eventDescription_" id="ed" >${eventDesc}</textarea></td>'
          +'      </tr>'
          +'    </table> '
          +'    <ul class="actions">'
          +'      <li> <a href="javascript:updateEventToDB(\'${eventId}\');" name="delete" class="websbutton"> Update Event</a> </li> '
          +'      <li> <a href="javascript:rzDeleteEvent(\'${eventId}\');" name="delete" class="websbutton"> Delete Event</a> </li> '
          +'</div>';
					+'      <td>Userd:</td><td><select disabled="disabled"><option value="${eventName}">${eventName}</option></td>'
            		+'      </tr><tr> '   
            		+'      <td>Event Description:</td><td> <textarea  class="inputbox" rows="1" cols="20" name="eventDescription_" id="ed" disabled="disabled">${eventDesc}</textarea></td>'
            		+'      </tr>'
				    +'		</table> '
            		+'    <ul class="actions">'
            		+'      <li> <a href="javascript:rzDeleteEvent(\'${eventId}\');" name="delete" class="websbutton"> Delete event</a> </li> '
            		+'</div>';
         	return _html;
      }


			
			
			var createMonthAllDayTemplate=function()
			{
				var _html='<div class="calendarTemplate"  id="monthAllDayTemplate" style="display:none;">'
							+'	<a href="#" eventId="${eventId}">'
							+'			<span>${formattedStartTime}</span> - <span>${formattedEndTime}</span>	'
							+'			<span>${eventName}</span></a> '
							+'</div>';
				return _html;
			} 
			var createQuickFilterTemplate=function()
			{
				var _html='<div id="quickFilterTemplate" style="display:none;">'
							+'	<div class="grp">'
							+'			<div class="grpName">'
							+'				<input type="checkbox" id="chkGrp${groupId}" value="${groupId}" class="grpChkBx">${groupName}'
							+'			</div>'
							+'			<div class="grpColr ${color.css}"><div class="filterBoxColor">A</div></div>'
							+' </div>'
						+'</div>';
				return _html;
			} 
			
			var createNewWorkshiftTemplate = function()
			{
			var _html = '<script type="text/javascript"> function showCalendar(){alert("youclicked me"); }; </script>'
              +'<div id="newWorkshiftTemplate" class="calendarTemplate newWorkshiftTemplate">  '
              +'  <div class="aPointer p-left " style="display: block; z-index: 0; " ></div>  '
              +'  <div class="acalclosebtn topright closeNewEvent"></div> '
              +'  <div class="header" > '
              +'    Create New Event '
              +'  </div>  '
              +'  <div style="padding:1px;height:80%;margin-bottom:0px;overflow:auto;">  '              
              +'    ${formattedStartTime} - ${formattedEndTime}'
              +'    ${eventName}   '
              +'  </div> '
              +'</div>';
        return _html;
       }
       
       
			var createNewEventTemplate = function()
			{
				var _html=  '<div id="defaultNewEventTemplate" class="calendarTemplate newEventTemplate">	'
							+'	<div class="aPointer p-left " style="display: block; z-index: 0; " ></div> 	'
							+'	<div class="acalclosebtn topright closeNewEvent"></div>	'
							+'	<div class="header" >	'
							+'		Create New Event '
							+'	</div>	'
							+'	<div style="padding:1px;height:80%;margin-bottom:30px;overflow:auto;">	'
							+'	<table cellpadding="0"  width="100%">		'
							+'		<tr>	'
							+'			<td valign="top">			'
							+'			<div>	'
							+'				<div class="label">User Name</div>	'
              +'        		<div class="selectUser"> '
              +'          		<select name="eventUser" style="width:10em; border:1px solid #C3D9FF;"  id="eventUser"></select>  '
              +'        		</div>   <br/>   '
							+'				<div>	'
							+'					<div class=" label" >	'
							+'						Resource:'
							+'					</div>	'
							+'					<div class="value">	'
							+'						<input  class="inputbox" rows="1" cols="20" name="eventSubGroup" id="eventSubGroup" style="border:1; background: #F2F2F2 " disabled="disabled"></input>'
							+'					</div>	'
							+'					<div class="value">	'
							+'						<input  class="inputbox"  name="eventSubID" id="eventSubID" type="hidden"></input>'
              +'            <input  class="inputbox"  name="eventGroup" id="eventGroup" type="hidden"></input>'							
							+'					</div>	'							
							+'				</div>	'
							+'				<div class="label">Resource Description</div>	'
							+'				<div class="value">	'
							+'					<textarea  class="inputbox" rows="2" cols="20" name="resourceDesc" id="resourceDesc" style="border: 1; background:#F2F2F2" disabled="disabled"></textarea>'
							+'				</div>	'						
							+'			</div> <br/>	'
							 
							+'       <div class="label">Event Description:</div> '
              +'        <div class="value"> '
              +'          <textarea  class="inputbox" rows="5" cols="20" name="newEventDesc" id="newEventDesc" style="border: 1"></textarea>'
              +'        </div>  '           
              +'      </div> <br/>  '                                 
							
							+'			<td  valign="top">	'
							+'			<div>	'
							+'				<div class="label ">	'
							+'					Start Date:'
							+'				</div>	'
							+'				<div class="startDate">	'
							+'					<input type="Text" name="eventStartDate" style="width:6em; border:1px solid #C3D9FF;" id="eventStartDate"/>	'
							+'				</div>			'
							+'			</div>	'
							+'			<div>	'
							+'				<div class="label " >	'
							+'					Start Time:'
							+'				</div>	'
							+'				<div class="startTime">	'
							+'					<input type="Text" name="eventStartTime" style="width:5em; border:1px solid #C3D9FF;" id="eventStartTime"/>	' 
							+'				</div>	 	'
							+'			</div> 	'
							+'			<div>	'
							+'				<div class="label ">	'
							+'					End Date:'
							+'				</div>	'
							+'				<div class="endDate">	'
							+'					<input type="Text" name="eventEndDate" style="width:6em; border:1px solid #C3D9FF;" id="eventEndDate"/>	'
							+'				</div>			'
							+'			</div>	  	'
							+'			<div>	'
							+'				<div class="label" >	'
							+'					End Time: '
							+'				</div>	'
							+'				<div class="endTime">	'
							+'					<input type="Text" name="eventEndTime" style="width:5em; border:1px solid #C3D9FF;" id="eventEndTime"/> 	'
							+'				</div>		 	'
							+'			</div>	'
							+'			</td>	'
							+'		</tr>	'
							+'	</table>   	'
							+'			<ul class="actions">'
							+'				<li id="addEventBtn"> <a href="javascript:rzAddEvent();" name="edit" class="websbutton"> Create event </a> </li>'
							+'				<li style="display:none;" id="updateEventBtn"> <a href="javascript:rzUpdateEvent();" name="Update" class="websbutton"> Update event </a> </li>'
							+'				<li> <a href="javascript:rzCloseAddEvent();" name="" class="websbutton"> Close the event</a> </li> '
							+'			</ul>'
							+'	</div>';
					return _html;
			}

			var createAgendaTemplate=function()
			{
				var _html=''
					+'	<div class="calendarTemplate"  id="agendaViewTemplate" style="display:none;">'
					+'		<div class="agendaDateEvents">'
					+'		<div class="dateTitle">'
					+'			${date.toFullDateString()}'
					+'		</div>'
					+'		<div class="agendaEventsForDate">'
					+'			<div field="events">'
					+'			<div class="agendaViewEvent" id="agendaViewEvent${eventId}${_localId}">'
					+'				<table width="100%" >'
					+'					<tr>'
					+'						<td width="60%">'
					+'							<div class="arrowExpand evtDtlArrowIcon" id="eventIcon${eventId}${_localId}"></div>'
					+'							<a href="#" onclick="agendaShowEventDetail(\'${eventId}${_localId}\')"><span style="font-weight:bold; ">${eventName}</span> </a>'
					+'						</td>'
					+'						<td width="28%"> '
					+'							(<span class="TextSizeXSmall"><span>${formattedStartTime}</span> - <span>${formattedEndTime}</span> </span>)  '
					+'						</td>'
					+'						<td width="10%">'
					+'							<span>${function:extractEventColor}</span>'
					+'						</td>'
					+'					</tr>'
					+'				</table>'
					+'			</div>'
					+'			<div id="eventDetail${eventId}${_localId}" class="agendaEventDetail" style="display:none;clear:both;">'
					+'				<table width="100%" cellpadding="2"  cellspacing="2" >'
					+'				<tr>'
					+'					<td valign="top">'
					+'						<span class="TextSizeXSmall">Start: </SPAN><span class="startTime">${formattedStartTime}</span>'
					+'						<br/>'
					+'						<span class="TextSizeXSmall">End: </SPAN><span class="startTime">${formattedEndTime}</span>'
					+'					</td> '
					+'					<td rowspan="3" align="right"> ' 
					+'							<div>'
					+'								<ul>'
					+'									<li><a href="#" onclick="agendaEditEvent(\'${eventId}\')">Edit Event agenda</a>'
					+'									<li> <a href="#" onclick="agendaDeleteEvent(\'${eventId}\')">Delete Event 1</a>'
					+'								</ul>	 '
					+'							</div>  '
					+'					</td>'
					+'				</tr>'
					+'				<tr> '
					+'					<td colspan="2" align="left">'
					+'						<span class="callabel TextSizeXSmall">'
					+'							Description:'
					+'						</span>			'
					+'						<div  class="EventDescription">'
					+'							${description}'
					+'						</div>'
					+'					</td>'
					+'				</tr>  '
					+'				</table>'
					+'			</div>'
					+'		</div>'
					+'		</div>'
					+'		</div>'
					+'	</div> ';

					return _html;
			}
			var load=function()
			{

				if(_windowDefaultPluginLoaded == false) //Load only once per page.
				{ 
					jQuery("body").append(createWeekEventTemplate())
								.append(createWeekSlotTemplate())
								.append(createMonthEventTemplate())
								.append(createDefaultPreview())	
								.append(createWorkshiftTemplate())	
								.append(createRecurEventOptions())								
								.append(createQuickFilterTemplate()) 							
								.append(createMonthAllDayTemplate()) 
								.append(createAgendaTemplate());
					if(options.full)
					{
						jQuery("body").append(createNewEventTemplate())
            //jQuery("body").append(createNewWorkshiftTemplate())
					  
					}
					_windowDefaultPluginLoaded=true;
				}
			}
			var _windowDefaultPluginLoaded=false;
			  load();
		}

