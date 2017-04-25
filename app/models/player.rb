class Player < ActiveRecord::Base
  belongs_to :team

  has_many :pg_player_stats
  has_many :total_player_stats
  has_many :player_descriptions
end