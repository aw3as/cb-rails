json.extract! @player, :id, :first_name, :last_name, :team_id
json.height @player.player_description.height
json.position @player.player_description.position
json.year @player.player_description.year
json.weight @player.player_description.weight