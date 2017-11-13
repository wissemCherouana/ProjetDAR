$(document).ready(function(){
	
	Results.SearchResults();
	var query = GetURLParameter('query').split("%20");
	console.log(query[0]);
	var query_search = ""; 
	for(i=0; i<query.length; i++)
		{
			query_search+=" "+query[i]; 
		}
	fillElement("#search_text", "Résultats de la recherche pour : "+ query_search);
		
});

function fillElement(eltDomInput, text){
	var textElt = $(eltDomInput);
	textElt.html(text);
}

var Results = {
		query: '',

		SearchResults: function(){
		
			this.query = GetURLParameter('query');
			if(this.query != undefined)
			{
				FetchSearchResults(this.query);
			}
			else
			{
				alert("Aucun résulat");
			}

		}
}


function FetchSearchResults(query){
	
	$.ajax({
		type: "GET",
		url : "SearchCinephile",
		dataType : 'json',
		data : {
			"query" : query
			},
		success : function(data) {

			var resultat = data;
			if (resultat.response==200)
			{
				if (resultat.cinephiles.length==0)
				{
					
					$("#search_result").css('display','inline'); 
				}
			else for(i=0; i<resultat.cinephiles.length; i++)
			{
				DisplaySearchResults(resultat.cinephiles[i]); 
			}
				
			}
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}

function DisplaySearchResults(result)
{
		var picture ; 
		if (result.gender=="homme") picture = "images/male.png"; 
		else picture="images/female.png";
		var DivCinephiles = $("#searchResults"); 
		var DivCinephile = '<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="item"><div class="pos-rlt">'+
	      	'<div class="item-overlay opacity r r-2x bg-black"><div class="center text-center m-t-n">'+
	        '<a style="cursor:pointer" onClick="ConsultOther('+result.id+')"  ><i class="fa fa-play-circle i-2x"></i></a></div></div>'+
	        '<a><img src='+picture+' alt="" class="r r-2x img-full"></a></div>'+
	        '<div class="padder-v">'+
	        '<a data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis">'+result.firstname+' '+result.lastname+'</a>'+
	        '<a data-bjax data-target="#bjax-target" data-el="#bjax-el" data-replace="true" class="text-ellipsis text-xs text-muted">'+result.address+'</a>'+
	        '</div></div></div>';
		DivCinephiles.append(DivCinephile); 

}

function ConsultOther(id)
{
	window.location=('ConsultOther.jsp?id_other='+id);
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

function SearchCinephileEvent()
{
	var query = $('#search_cinephile').val(); 
	window.location=('SearchResults.jsp?query='+query); 
}

function Logout()
{
	$.ajax({
		type: "POST",
		url : "logout",
		success : function() {
			window.location=('Login.jsp'); 
		},
		error : function(XHR, testStatus, errorThrown) 
		{
			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
		}
	});
}