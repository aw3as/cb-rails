class PlayersController < ApplicationController

  # GET /, GET /players
  def index
    if params[:team]
      team = Team.find_by_sql("SELECT * FROM teams WHERE school LIKE '%#{params[:team]}%';").first
      @players = Player.find_by_sql("SELECT * FROM players WHERE team_id = #{team.id};")
    else
      @players = Player.find_by_sql("SELECT * FROM players;")
    end
  end

  # GET /players/:id
  def show
    @player = Player.find_by_sql("SELECT * FROM players WHERE id = #{params[:id]};").first
  end

end