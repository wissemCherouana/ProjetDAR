$(document).ready(function(){
		GetEvents(); 	
	});

	function GetEvents()
	{
		$.ajax({
			type: "GET",
			url : "SeeEvents",
			dataType : 'json',
			success : function(data) {
				if (data.response==200)
				{
					var events = data.events;
					
					if(events.length == 0)
					{
						console.log("la liste contient 0 items"); 
					} 
					else 
					{
						for(i=0; i<events.length; i++)
							{
								displayEvent(events[i]); 
							}
					}
				}
				
			},
			error : function(XHR, testStatus, errorThrown) 
			{
				console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
			}
		});
	}

	function displayEvent(event)
	{
		
		
		  var date =new Date(event.date);  //converts the string into date object
		  var day =date.getDate(); //get the value of month
		  var monthNames = ["JAN", "FEV", "MARS", "AVR", "MAI", "JUIN",
			  "JUIL", "AOUT", "SEP", "OCT", "NOV", "DEC"
			];
		  var month = monthNames[date.getMonth()]; 
		  var year = date.getFullYear(); 
		  var hour = date.getHours() + ':'+date.getMinutes();
		 
		
		
		var DivContainer = $("#events_cards"); 
		var DivEvent = '<div class="example-1 card col-sm-4" style="margin-bottom:15px"><div class="wrapper" style="padding:0px!important; background: url('+event.affiche+') center/cover no-repeat;"><div class="date"><span class="day">'+day+'</span><span class="month">'+month+'</span><span class="year">'+year+'</span></span><span class="year" style="font-weight:bold">'+hour+'</span>'+
	      '</div><div class="data"><div class="content"><span class="author">Organisé par : <a href="#" style="color:red">'+event.cinephile+'</a></span><h1 class="title"><a href="#">'+event.title+'</a></h1>'+
	          '<p class="text">'+event.description+'</p>'+
	          '<label for="show-menu'+event.id_event+'" class="menu-button"><span></span></label></div><input type="checkbox" id="show-menu'+event.id_event+'" />'+
	           '<ul class="menu-content"><li><a href="#" class="icon-like" style="margin-top:10px"><span style="width:350px; top: -15px;">Participer</span></a></li><li><a class="fa fa-map-marker" style="margin-top:10px"><span style="width:350px; top: -15px;">'+event.place+'</span></a></li>'+
	          '<li><a class="icon-users"  style="margin-top:10px"><span style=" width:100px; top: -15px;">MAX = '+event.limit+'</span></a></li></ul></div></div></div>'
		DivContainer.append(DivEvent);

	}