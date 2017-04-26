json.array! @players do |player|
  json.extract! player, :id, :first_name, :last_name
  json.team player.team.school
end