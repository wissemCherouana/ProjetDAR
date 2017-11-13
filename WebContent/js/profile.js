$(document ).ready(function(){
	
	ShowProfileCinephile();
	SeeEvents();
		
});

function ShowProfileCinephile(){
	//readUser avec UserServlet/AccountServlet dans l'approche REST
	//ou ReadUserServlet dans l'approche SOAP
	$.ajax({
		type: "GET",
		url : "seeProfile",
		dataType : 'json',
		success : function(data) {

			var resultat = data;
			if (resultat.response==200)
			{
				
				showprofil (resultat);
			}
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}

function showprofil (resultat)
{
	//la fonction fillInput prend un element DOM et met le deuxième param en  valeur
	fillInput("#firstname",resultat.firstname);
	fillInput("#lastname",resultat.lastname);
	fillInput("#address",resultat.address);
	fillInput("#description",resultat.description);
	
	
}

function fillInput(eltDomInput, text){
	var textElt = $(eltDomInput);
	textElt.html(text);
}

function SeeEvents(){

	$.ajax({
		type: "GET",
		url : "SeeEventsCinephile",
		dataType : 'json',
		success : function(data) {

			var resultat = data;
			if (resultat.response==200)
			{
				 
				for (i=0; i<resultat.events_organized.length; i++)
					displayEventOrganized(resultat.events_organized[i]); 
				
				for (i=0; i<resultat.events_joined.length; i++)
					displayEventJoined(resultat.events_joined[i]); 
			}
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}


function displayEventOrganized(event)
{

	
	var date =new Date(event.date);  //converts the string into date object
	  var day =date.getDate(); //get the value of month
	  var monthNames = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
		  "Juillet", "Août", "septembre", "Octobre", "Novembre", "Decembre"
		];
	  var month = monthNames[date.getMonth()]; 
	  var year = date.getFullYear(); 
	  var hour = date.getHours() + ':'+date.getMinutes();
	
	var DivContainer = $("#events_organized"); 
	var DivEvent = '<a class="list-group-item clearfix" style="text-align:left"><span class="pull-right h2 text-muted m-l"></span>'+
    '<span class="pull-left thumb-sm m-r" style="width:63px"><img src="'+event.affiche+'" alt="..."></span><span class="clear">'+
    '<span style="font-weight:bold; font-size:18px">'+event.title+'</span><small class="text-muted" style="color:#428bca!important"></small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-calendar icon text-success" style="margin-right:20px"></i>'+day+ ' '+month+' '+year+' </small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-clock icon text-info" style="margin-right:20px"></i>'+hour+' </small>'+
    '<small class="text-muted"style="font-size:13px"><i class="fa fa-map-marker icon text-primary" style="margin-right:25px"></i>'+event.place+'</small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-users icon text-danger" style="margin-right:20px"></i>'+event.limit+' Personnes maximum </small></span></a>';
		
	DivContainer.append(DivEvent);

}

function displayEventJoined(event)
{

	
	var date =new Date(event.date);  //converts the string into date object
	  var day =date.getDate(); //get the value of month
	  var monthNames = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
		  "Juillet", "Août", "septembre", "Octobre", "Novembre", "Decembre"
		];
	  var month = monthNames[date.getMonth()]; 
	  var year = date.getFullYear(); 
	  var hour = date.getHours() + ':'+date.getMinutes();
	
	var DivContainer = $("#events_joined"); 
	var DivEvent = '<a class="list-group-item clearfix" style="text-align:left"><span class="pull-right h2 text-muted m-l"></span>'+
    '<span class="pull-left thumb-sm m-r" style="width:63px"><img src="'+event.affiche+'" alt="..."></span><span class="clear">'+
    '<span style="font-weight:bold; font-size:18px">'+event.title+'</span><small class="text-muted" style="color:#428bca!important"></small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-calendar icon text-success" style="margin-right:20px"></i>'+day+ ' '+month+' '+year+' </small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-clock icon text-info" style="margin-right:20px"></i>'+hour+' </small>'+
    '<small class="text-muted"style="font-size:13px"><i class="fa fa-map-marker icon text-primary" style="margin-right:25px"></i>'+event.place+'</small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:13px"><i class="icon-users icon text-danger" style="margin-right:20px"></i>'+event.limit+' Personnes maximum </small></span></a>';
		
	DivContainer.append(DivEvent);

}