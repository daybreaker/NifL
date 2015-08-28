# Pick Sets
class PicksetsController < ApplicationController
  before_action :set_pickset, only: [:show, :edit, :update, :destroy]

  # GET /picksets
  def index
    @picksets = Pickset.all
  end

  # GET /picksets/1
  def show
      @pickset_season = @season.to_json
      @grouped_teams = Team.by_conference
  end

  # GET /picksets/new
  def new
    @pickset = Pickset.new
  end

  # GET /picksets/1/edit
  def edit
  end

  # POST /picksets
  def create
    @pickset ||= Pickset.new(pickset_params)

    if @pickset.save
      redirect_to root_path, notice: "Pickset was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /picksets/1
  def update
    if @pickset.update(pickset_params)
      redirect_to root_path, notice: 'Pickset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /picksets/1
  def destroy
    @pickset.destroy
    redirect_to root_path, notice: 'Pickset was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pickset
    @pickset = Pickset.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pickset_params
    params.require(:pickset).permit(:season_id, :user_id, :name)
  end
end
