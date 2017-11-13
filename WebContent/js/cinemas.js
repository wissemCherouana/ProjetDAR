$(document).ready(function(){
	
	GetCinemas(); 
	
});
 
function sendEvent() {
	var title= $('#title').val();
	var description = $('textarea#description').val();
	var place = $('#place').val();
	var date = $('#date').val();
	var limit = $('#limit').val();
	SaveEvent(title, description, place, date, limit);

}


function SaveEvent(title, description, place, date, limit) {
	console.log("send to AddEventServlet");
	$.ajax({
		type : "POST",
		url : "AddEvent",
		data : {
			"title" : title, 
			"description" : description, 
			"place" : place,
			"date" : date, 
			"limit" : limit
		},
		dataType : "json",
		success : function(data) {
			var resultat=data;
			if (resultat.response==200)
			{			
				window.location=('Events.jsp');
			}
		},
		error : function(XHR, testStatus, errorThrown) {
			console.log("status: " + XHR.status + ", erreur: "
					+ XHR.responseText);
		}
	});
}

function seeCinemas()
{
	window.location=('MapCinemasIleDeFrance.jsp');
}



function GetCinemas()
{
	$.ajax({
		type: "GET",
		url : "GetIleDeFranceCinemas",
		dataType : 'json',
		success : function(data) {
			if (data.message==1)
			{
				var cinemas = data.cinemas;
				var seances = data.seances; 
				
				if(cinemas.length == 0)
				{
					console.log("la liste contient 0 items"); 
				} 
				else 
				{
					for(i=0; i<seances.length; i++)
					{
						var seance = seances[i].id + " / " +seances[i].movie + " / " + seances[i].date;  
						addOptionSeance(seance);
						console.log(seances[i]); 
					}	
					
					var array = new Array();
					for(i=0; i<cinemas.length; i++)
						{
								// console.log(cinemas[i].fields.enseigne); 
								 array.push(cinemas[i].fields.enseigne); 
						}	
					var options = {
							data : array,
							list: {
								maxNumberOfElements: 309,
								match: {
									enabled: true
								}
							}
						};
					$("#place").easyAutocomplete(options);
				}
			}
			
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}

function addOptionSeance(seance)
{
	var select = $("#date"); 
	var option = '<option name="'+seance+'">'+seance+'</option>';
	select.append(option); 
}
