$(document).on('ready', function() {
	"use strict";

	// volunteer check
	if ($('#team-container').length === 0) {
		return;
	}

	$('#teams').parents('.nav-row').addClass('active');

	var team = $('#team-container');
});