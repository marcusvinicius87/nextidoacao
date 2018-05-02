// Inclua nas versões quando rails >= 5.1
//= require jquery
//= require jquery_ujs

// Sempre inclua
//= require cocoon
//= require turbolinks
//= require materialize-sprockets
//= require_tree .


function asd() {

     var divsToHide = document.getElementsByClassName("asd"); //divsToHide is an array
     for(var i = 0; i < divsToHide.length; i++){
        divsToHide[i].style.visibility = "hidden"; // or
        divsToHide[i].style.display = "none"; // depending on what you're doing
    }

}

function asd2() {

     var divsToHide = document.getElementsByClassName("asd2"); //divsToHide is an array
     for(var i = 0; i < divsToHide.length; i++){
        divsToHide[i].style.visibility = "hidden"; // or
        divsToHide[i].style.display = "none"; // depending on what you're doing
    }

}


