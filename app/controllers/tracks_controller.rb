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

  def stats
    today = Date.today
    week_beginning = today.at_beginning_of_week
    month_beginning = today.at_beginning_of_month
    @month_tracks = Track.where("created_at >= #{month_beginning}")
    @week_tracks = @month_tracks.where("created_at >= #{week_beginning}")
    #avoiding additional db query by .sum("distance")
    @distance_sum = 0
    @week_tracks.map {|track| @distance_sum += track.distance}
    #need better solution below this line
    @month_days = Hash.new
    (today.at_beginning_of_month..today.at_end_of_month).map do |day|
      @month_days[day] = 0
      @month_tracks.where(created_at: (day.beginning_of_day..day.end_of_day)).map do |track|
        @month_days[day] +=track.distance
      end 
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
