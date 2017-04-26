class Team < ActiveRecord::Base

  def conference
    Conference.find_by_sql("SELECT * FROM conferences WHERE id = #{conference_id}").first
  end

  def advanced_team_stat
    AdvancedTeamStat.find_by_sql("SELECT * from advanced_team_stats WHERE team_id = #{id}").first
  end

  def total_team_stat
    TotalTeamStat.find_by_sql("SELECT * from total_team_stats WHERE team_id = #{id}").first
  end

  def pg_team_stat
    PGTeamStat.find_by_sql("SELECT * from pg_team_stats WHERE team_id = #{id}").first
  end

  def team_record
    TeamRecord.find_by_sql("SELECT * from team_records WHERE team_id = #{id}").first
  end

  def coach
    Coach.find_by_sql("SELECT * from coaches WHERE team_id = #{id}").first
  end

  def players
    Player.find_by_sql("SELECT * from players WHERE team_id = #{id}")
  end

end