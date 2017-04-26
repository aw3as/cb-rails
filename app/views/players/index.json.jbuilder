json.array! @players do |player|
  json.extract! player, :id, :first_name, :last_name
  json.team player.team.school
  json.advanced player.advanced_player_stat
  json.total player.total_player_stat
  json.pg player.pg_player_stat
end