require 'csv'

Conference.destroy_all
Team.destroy_all
Coach.destroy_all
Player.destroy_all
PlayerDescription.destroy_all

puts 'loading conferences...'
header = true
File.open("db/csv/Conferences.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  conference = Conference.find_by(:name => data.last)
  unless conference
    conference = Conference.create(:name => data.last)
  end
  team = Team.find_by(:school => data.first)
  unless team
    Team.create(:conference_id => conference.id, :school => data.first)
  end
end

puts 'loading coaches...'
header = true
File.open("db/csv/Coaches.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data.first)
  unless team
    puts row
    puts 'no team'
    next
  end
  Coach.create(
    :team_id => team.id,
    :first_name => data[1],
    :last_name => data[2]
  )
end

puts 'loading players...'
header = true
File.open("db/csv/PlayerDescriptions.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data.first)
  unless team
    puts row
    puts 'no team'
    next
  end
  player = Player.create(
    :team_id => team.id,
    :first_name => data[1].split(' ').first,
    :last_name => data[1].split(' ').last,
  )
  PlayerDescription.create(
    :player_id => player.id,
    :year => data[3],
    :position => data[4],
    :height => data[5],
    :weight => data[6]
  )
end

puts 'loading pg_player_stats'
header = true
File.open("db/csv/PlayerStatsPerGame.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data.first)
  player = Player.find_by(:first_name => data[2].split(' ').first, :last_name => data[2].split(' ').last)
  unless player
    puts row
    puts 'no player'
    next
  end
  PGPlayerStat.create(
    :player_id => player.id,
    :fg => data[5],
    :fga => data[6],
    :tpt => data[11],
    :tpta => data[12],
    :ft => data[14],
    :fta => data[15],
    :ast => data[18],
    :stl => data[19],
    :pts => data[-1]
  )
end

puts 'loading total_player_stats'
header = true
File.open("db/csv/PlayerStatsTotal.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data.first)
  player = Player.find_by(:first_name => data[2].split(' ').first, :last_name => data[2].split(' ').last)
  unless player
    puts row
    puts 'no player'
    next
  end
  TotalPlayerStat.create(
    :player_id => player.id,
    :fg => data[5],
    :fga => data[6],
    :tpt => data[11],
    :tpta => data[12],
    :ft => data[14],
    :fta => data[15],
    :orb => data[17],
    :drb => data[18],
    :ast => data[20],
    :stl => data[21],
    :pts => data[-1]
  )
end

puts 'loading advanced_team_stats'
header = true
File.open("db/csv/team_adv_stat.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data[1])
  unless team
    puts row
    puts 'no team'
    next
  end
  AdvancedTeamStat.create(
    :team_id => team.id,
    :em => data[5],
    :o => data[6],
    :d => data[8],
    :t => data[10],
    :luck => data[12]
  )
  TeamRecord.create(
    :team_id => team.id,
    :wins_total => data[3],
    :losses_total => data[4]
  )
end

puts 'loading pg_team_stats'
header = true
File.open("db/csv/teams_per_game.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data[0])
  unless team
    puts row
    puts 'no team'
    next
  end
  PGTeamStat.create(
    :team_id => team.id,
    :fg => data[6],
    :fga => data[7],
    :tpt => data[10],
    :tpta => data[11],
    :ft => data[12],
    :fta => data[13],
    :orb => data[4],
    :drb => data[5],
    :ast => data[-2],
    :stl => data[-1],
    :pts => data[2],
    :ptsa => data[3]
  )
end

puts 'loading total_team_stats'
header = true
File.open("db/csv/teams_total.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data[0])
  unless team
    puts row
    puts 'no team'
    next
  end
  TotalTeamStat.create(
    :team_id => team.id,
    :fg => data[3],
    :fga => data[4],
    :tpt => data[6],
    :tpta => data[7],
    :ft => data[9],
    :fta => data[10],
    :orb => data[12],
    :drb => data[13],
    :ast => data[14],
    :stl => data[15],
    :pts => data[2],
    :ptsa => data[-1]
  )
end

puts 'loading advanced_player_stats'
header = true
File.open("db/csv/updated_adv_stat_2.csv", "r").read.split("\n").each do |row|
  if header
    header = false
    next
  end

  data = row.split(',')
  team = Team.find_by(:school => data[1])
  unless team
    puts row
    puts 'no team'
    next
  end
  player = Player.find_by(:first_name => data[2], :last_name => data[3])
  unless player
    puts row
    puts 'no player'
    next
  end
  AdvancedPlayerStat.create(
    :player_id => player.id,
    :usg => data[7],
    :ortg => data[8],
    :drtg => data[9],
    :ts => data[10],
    :efg => data[11],
    :ft => data[12],
    :tfg => data[13],
    :orb => data[14],
    :drb => data[15],
    :trb => data[16],
    :ast => data[17],
    :stl => data[18],
    :blk => data[19],
    :turn => data[20]
  )
end