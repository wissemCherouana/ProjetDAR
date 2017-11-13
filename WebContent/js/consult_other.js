
$(document ).ready(function(){
	
	account.readUser();
		
});
/**
 * object account for actions in account page
 */
var account = {
		id_other: '',

		readUser: function(){
			console.log("account.ReadUser");
			
			this.id_other = GetURLParameter('id_other');
			console.log('id_other:'+this.id_other)
			if(this.id_other != undefined)
			{
				readUserServer(this.id_other);
			}
			else
			{
				alert("Personne non reconnue");
			}	
			
		}
}
/**
 * sends ajax to ConsulterUserServlet
 * @param idU
 */
function readUserServer(id_other){
	//readUser avec UserServlet/AccountServlet dans l'approche REST
	//ou ReadUserServlet dans l'approche SOAP
	$.ajax({
		type: "GET",
		url : "ConsultOtherCinephile",
		dataType : 'json',
		data : {
			"id_other" : id_other
			},
		success : function(data) {

			var resultat = data;
			if (resultat.response==200)
			{
				showprofil (resultat);
				//return resultat;
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

function sendMessage()
{
	window.location=('AddMessage.jsp?id_other='+GetURLParameter('id_other'));
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


