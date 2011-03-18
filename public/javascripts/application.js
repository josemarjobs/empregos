// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
window.onload = puts;
function puts(){
	document.getElementById("term").value = "Encontre as vagas facilmente";
	document.getElementById("term").onblur = rollOut;
	document.getElementById("term").onmousedown = rollOver;
}

function rollOut(){
	this.value="Encontre as vagas facilmente";
}

function rollOver(){
	this.value="";
}
