class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def show
    @track = Track.find(params[:id])
  end

  def create
    @track = Track.new track_params
    if @track.save
      redirect_to @track
    else
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id]).destroy
    redirect_to tracks_path
  end

  private
  def track_params
    params.require(:track).permit :location_a, :location_b
  end
end
