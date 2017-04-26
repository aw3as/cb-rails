json.array! @teams do |team|
  json.extract! team, :id, :school
  json.conference team.conference.name
end