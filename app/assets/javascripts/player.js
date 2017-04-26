$(document).on('ready', function() {
	"use strict";

	// volunteer check
	if ($('#player-container').length === 0) {
		return;
	}

	$('#players').parents('.nav-row').addClass('active');

	var player = $('#player-container'),
		addModal = $('#add-modal');

	addModal.find('h2').text('Edit Player');
	addModal.find('#delete').removeClass('hidden');

	player.find('.glyphicon-pencil').click(function() {
		$.ajax('/players/' + player.data('player') + '.json', {
			success: function(response) {
				addModal.find('[name=first_name]').val(response.first_name);
				addModal.find('[name=last_name]').val(response.last_name);
				addModal.find('[name=height]').val(response.height);
				addModal.find('[name=weight]').val(response.weight);
				addModal.find('[name=position]').val(response.position);
				addModal.find('[name=year]').val(response.year);
				addModal.find('[name=team_id]').val(response.team_id);
				addModal.modal('show');
			}
		});
	});

	addModal.find('.btn-primary').click(function() {
		$.ajax('/players/' + player.data('player') + '.json', {
			method: 'PUT',
			data: addModal.find('form').serialize(),
			complete: function(response) {
				window.location.reload();
			}
		});
	});

	addModal.find('.btn-danger').click(function() {
		$.ajax('/players/' + player.data('player') + '.json', {
			method: 'DELETE',
			complete: function(response) {
				window.location = '/players'
			}
		});
	});
});