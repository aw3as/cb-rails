$(document).on('ready', function() {
	"use strict";

	// volunteer check
	if ($('#players-container').length === 0) {
		return;
	}

	$('.glyphicon-education').parents('.nav-row').addClass('active');

	var playersContainer = $('#players-container');

	function loadPlayers(players) {
		playersContainer.find('.col-sm-3:not(.hidden)').remove();

		$.each(players, function(index, player) {
			var playerBox = playersContainer.find('.col-sm-3.hidden').clone().removeClass('hidden');

			playerBox.find('h2').text(player.first_name + ' ' + player.last_name);
			playerBox.find('h4').text(player.team);

			playerBox.find('.box').click(function() {
				window.location = '/players/' + player.id;
			});

			playersContainer.append(playerBox);
		});
	}

	$.ajax('players.json', {
		success: function(response) {
			loadPlayers(response);
		}
	});

	playersContainer.find('input').keyup(function(e) {
		if (e.keyCode !== 13) {
			return;
		}
		$.ajax('players.json', {
			data: {
				team: $(this).val()
			},
			success: function(response) {
				loadPlayers(response);
			}
		});
	});
});