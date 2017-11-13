$(document).ready(function(){
	GetSeances(); 
	
});

function GetSeances()
{
	$.ajax({
		type: "GET",
		url : "SeeSeancesMovies",
		dataType : 'json',
		success : function(data) {
			if (data.response==200)
			{
				var seances = data.seances;
				
				if(seances.length == 0)
				{
					console.log("la liste contient 0 items"); 
				} 
				else 
				{
					for(i=0; i<seances.length; i++)
						{
							displaySeance(seances[i]); 
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

function displaySeance(seance)
{

	
	var date =new Date(seance.date);  //converts the string into date object
	  var day =date.getDate(); //get the value of month
	  var monthNames = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
		  "Juillet", "Août", "septembre", "Octobre", "Novembre", "Decembre"
		];
	  var month = monthNames[date.getMonth()]; 
	  var year = date.getFullYear(); 
	  var hour = date.getHours() + ':'+date.getMinutes();
	
	var DivContainer = $("#seances"); 
	var DivSeance = '<a class="list-group-item clearfix"><span class="pull-right h2 text-muted m-l"></span>'+
    '<span class="pull-left thumb-sm m-r" style="width:120px"><img src="'+seance.affiche+'" alt="..."></span><span class="clear">'+
    '<span style="font-weight:bold; font-size:30px">'+seance.movie+'</span><small class="text-muted" style="color:#428bca!important"></small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:20px"><i class="icon-calendar icon text-success" style="margin-right:20px"></i>'+day+ ' '+month+' '+year+' </small>'+
    '<small class="text-muted clear text-ellipsis" style="font-size:20px"><i class="icon-clock icon text-info" style="margin-right:20px"></i>'+hour+' </small>'+
    '<small class="text-muted"style="font-size:20px"><i class="fa fa-map-marker icon text-primary" style="margin-right:20px"></i>'+seance.place+'</small></span></a>';
		
	DivContainer.append(DivSeance);

}
