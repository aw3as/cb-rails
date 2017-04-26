class Player < ActiveRecord::Base

  def team
    Team.find_by_sql("SELECT * FROM teams WHERE id = #{team_id};").first
  end

  def advanced_player_stat
    AdvancedPlayerStat.find_by_sql("SELECT * from advanced_player_stats WHERE player_id = #{id}").first
  end

  def total_player_stat
    TotalPlayerStat.find_by_sql("SELECT * from total_player_stats WHERE player_id = #{id}").first
  end

  def pg_player_stat
    PGPlayerStat.find_by_sql("SELECT * from pg_player_stats WHERE player_id = #{id}").first
  end

  def player_description
    PlayerDescription.find_by_sql("SELECT * from player_descriptions WHERE player_id = #{id}").first
  end

end