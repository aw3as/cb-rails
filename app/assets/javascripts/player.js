$(document).on('ready', function() {
	"use strict";

	// volunteer check
	if ($('#player-container').length === 0) {
		return;
	}

	$('.glyphicon-education').parents('.nav-row').addClass('active');

	var player = $('#player-container');
});