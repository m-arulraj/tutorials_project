/**
 * 
 */
function setActions(controller, action) {
	document.getElementById('actionController').value = controller;
	document.getElementById('action').value = action;
}

function submitForm(form_id){
	
	document.getElementById(form_id).submit();
}