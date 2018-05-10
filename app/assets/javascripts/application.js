// Inclua nas versões quando rails >= 5.1
//= require jquery
//= require jquery_ujs

// Sempre inclua
//= require cocoon
//= require turbolinks
//= require materialize-sprockets
//= require_tree .

var count = -1;
function asd() {
     var divsToHide = document.getElementsByClassName("asd"); //divsToHide is an array
     var divsToShow = document.getElementsByClassName("idtelef");

     for(var i = 0; i < divsToHide.length; i++){
        divsToHide[i].style.visibility = "hidden"; 
        divsToHide[i].style.display = "none";  
        divsToShow[i].style = "";
    }

  	count ++;
    
}

function asd2() {
     var divsToHide = document.getElementsByClassName("asd2"); 
     for(var i = 0; i < divsToHide.length; i++){
        divsToHide[i].style.visibility = "hidden";  
        divsToHide[i].style.display = "none";  
    }
}

function asd3(cont) {
	var telefones = document.getElementsByClassName("idtelef");
	var telefonesEscondidos = document.getElementsByClassName("asd");

	telefonesEscondidos[cont].style = ""  
    telefones[cont].style.visibility = "hidden";
}


