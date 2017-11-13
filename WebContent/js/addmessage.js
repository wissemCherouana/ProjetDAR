$(document).ready(function() {
	GetMessages(); 
});



function sendMessage() {
	var content= $('#message').val();
	//alert(content);
	var id_receiver = GetURLParameter('id_other');
	SaveMessage(id_receiver,content);

}
//penser à regler la jsp de l'affichage des msg apres envoie
function SaveMessage(id_receiver,content) {
	console.log("send to AddCommentServlet");
	$.ajax({
		type : "POST",
		url : "AddMessage",
		data : {
			"id_other" : id_receiver,
			"content" : content
		},
		dataType : "json",
		success : function(data) {
			var resultat=data;
			if (resultat.response==200)
			{			
				DisplayNewMessage(data);	
				$('#message').val("");
			}
		},
		error : function(XHR, testStatus, errorThrown) {
			console.log("status: " + XHR.status + ", erreur: "
					+ XHR.responseText);
		}
	});
}

function DisplayMyMessage(message)
{
	var date = new Date(message.date);
	var displayDate = formatAMPM(date);
	
	var DivChat = $("#chat"); 
	var DivMine = '<article id="chat-id-2" class="chat-item right" style="border-left-color: #36b0c8!important;"><a href="#" class="pull-right thumb-sm avatar">'+
		'<img src="images/female.png" class="img-circle" alt="..."></a><section class="chat-body"><div class="panel bg-light text-sm m-b-none" style="    background-color: #36b0c8; color: #fff;" >'+
		'<div class="panel-body"><span class="arrow right" style="border-left-color: #36b0c8!important;"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
        '<small class="text-muted">'+displayDate+'</small></section></article> '; 
	DivChat.append(DivMine); 
	
}

function DisplayNewMessage(message)
{
	var date = new Date();
	var displayDate = formatAMPM(date);
	
	var DivChat = $("#chat"); 
	var DivMine = '<article id="chat-id-2" class="chat-item right" style="border-left-color: #36b0c8!important;"><a href="#" class="pull-right thumb-sm avatar">'+
		'<img src="images/female.png" class="img-circle" alt="..."></a><section class="chat-body"><div class="panel bg-light text-sm m-b-none" style="    background-color: #36b0c8; color: #fff;" >'+
		'<div class="panel-body"><span class="arrow right" style="border-left-color: #36b0c8!important;"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
        '<small class="text-muted">'+displayDate+'</small></section></article> '; 
	DivChat.append(DivMine);  
	
}

function DisplayMessageOther(message)
{
	var date = new Date(message.date);
	var displayDate = formatAMPM(date);
	
	var DivChat = $("#chat"); 
	var DivOther = '<article id="chat-id-1" class="chat-item left"><a href="#" class="pull-left thumb-sm avatar">'
		+'<img src="images/female.png" alt="..."></a><section class="chat-body"><div class="panel b-light text-sm m-b-none">'+
          '<div class="panel-body"><span class="arrow left"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
        '<small class="text-muted"><i class="fa fa-ok text-success"></i>'+displayDate+'</small></section></article>'; 
	DivChat.append(DivOther); 
	
}

function GetMessages()
{
	id_receiver = GetURLParameter('id_other'); 
	$.ajax({
		type: "GET",
		url : "DisplayMessagesBetweenTwoCinephiles",
		dataType : 'json',
		data : {
			"id_other" : id_receiver
			},
		success : function(data) {

			var resultat = data;
			if (resultat.response==200)
			{
				
				var messages = resultat.messages.sort(function(a, b) {
				    return new Date(a.date).getTime() - new Date(b.date).getTime();
				});
				for(i=0; i<messages.length; i++)
				{
					if (messages[i].status=="sent") DisplayMyMessage(messages[i]);
					else DisplayMessageOther(messages[i]);
				}	
				
				
			}
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}

function formatAMPM(date) { 
	 
	  var hours = date.getHours();
	  var minutes = date.getMinutes();
	  minutes = minutes < 10 ? '0'+minutes : minutes;
	  hours = hours == 0 ? '0'+hours : hours; 
	  var strTime = hours + ':' + minutes;
	  return displayDate = date.getDate()+ '-' + (date.getMonth()+1)+'-' +date.getFullYear()+ ' ' +strTime;
	}

	
	
	
function GetURLParameter(sParam)
{
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++)
	{
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam)
		{
			return sParameterName[1];
		}
	}
}
