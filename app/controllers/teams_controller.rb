class TeamsController < ApplicationController

  # GET /, GET /teams
  def index
    @teams = Team.find_by_sql("SELECT * FROM teams;")
  end

  # GET /teams/:id
  def show
    @team = Team.find_by_sql("SELECT * FROM teams WHERE id = #{params[:id]};").first
  end

end