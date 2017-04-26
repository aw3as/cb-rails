class PlayersController < ApplicationController
  before_action :authenticate_user!, :only => [ :create, :update, :destroy ]

  # GET /, GET /players
  def index
    if params[:team]
      team = Team.find_by_sql("SELECT * FROM teams WHERE school LIKE '%#{params[:team]}%';").first
      @players = Player.find_by_sql("SELECT * FROM players WHERE team_id = #{team.id};")
    else
      @players = Player.find_by_sql("SELECT * FROM players;").reverse
    end
  end

  # GET /players/:id
  def show
    @player = Player.find_by_sql("SELECT * FROM players WHERE id = #{params[:id]};").first
  end

  # POST /players
  def create
    ActiveRecord::Base.connection.execute("INSERT INTO players (team_id, first_name, last_name, created_at, updated_at) VALUES (#{params[:team_id]}, '#{params[:first_name]}', '#{params[:last_name]}', '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}', '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}')")
    player = Player.find_by_sql("SELECT * FROM players ORDER BY id DESC LIMIT 1;").first
    ActiveRecord::Base.connection.execute("INSERT INTO player_descriptions (player_id, height, weight, position, year, created_at, updated_at) VALUES (#{player.id}, #{params[:height]}, #{params[:weight]}, '#{params[:position]}', '#{params[:position]}', '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}', '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}')")
    head :ok
  end

  # PUT /players/:id
  def update
    ActiveRecord::Base.connection.execute("UPDATE players SET team_id=#{params[:team_id]}, first_name = '#{params[:first_name]}', last_name = '#{params[:last_name]}', updated_at = '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}' WHERE id=#{params[:id]}")
    ActiveRecord::Base.connection.execute("UPDATE player_descriptions SET height = '#{params[:height]}', weight = '#{params[:weight]}', year = '#{params[:year]}', position = '#{params[:position]}', updated_at = '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}' WHERE player_id=#{params[:id]}")
    head :ok
  end

  # DELETE /players/:id
  def destroy
    ActiveRecord::Base.connection.execute("DELETE FROM players WHERE id=#{params[:id]}")
    ActiveRecord::Base.connection.execute("DELETE FROM player_descriptions WHERE player_id=#{params[:id]}")
    head :ok
  end

end