$(document).on('ready', function() {
	"use strict";

	// volunteer check
	if ($('#teams-container').length === 0) {
		return;
	}

	$('#teams').parents('.nav-row').addClass('active');

	var teams = $('#teams-container');

	$.ajax('teams.json', {
		success: function(response) {
			$.each(response, function(index, team) {
				var teamBox = teams.find('.hidden').clone().removeClass('hidden');

				teamBox.data('team', team.id);

				teamBox.find('h2').text(team.school);
				teamBox.find('h4').text(team.conference);

				teamBox.find('.box').click(function() {
					window.location = '/teams/' + team.id;
				});

				teams.append(teamBox);
			});
		}
	});
});