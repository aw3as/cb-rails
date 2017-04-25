class Team < ActiveRecord::Base
  belongs_to :conference

  has_many :players

  has_many :advanced_team_stats
  has_many :total_team_stats
  has_many :pg_team_stats

  has_many :team_records

  has_many :coaches
end