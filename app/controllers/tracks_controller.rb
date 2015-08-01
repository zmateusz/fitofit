class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :track_owner?, only: [:show, :destroy]
  
  def index
    @tracks = Track.where(user_id: current_user.id)
  end

  def new
    @track = Track.new
  end

  def show
    redirect_to tracks_path unless track_owner?
  end

  def create
    @track = Track.new track_params
    @track.user_id = current_user.id
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
    month_end = today.at_end_of_month

    @month_days = Hash.new
    (month_beginning..month_end).map do |day|
      @month_days[day] = 0
    end

    @month_distance = 0
    @week_distance = 0
    month_tracks = Track.where("created_at >= '#{month_beginning}' AND user_id = #{current_user.id}")
    if month_tracks.present?
      month_tracks.each {|track| @month_days[track.created_at.to_date] += track.distance}
      @week_tracks = month_tracks.select{|track| track.created_at >= week_beginning}

      month_tracks.map {|track| @month_distance += track.distance}
      @week_tracks.map {|track| @week_distance += track.distance}
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy if track_owner?
    redirect_to tracks_path
  end

  private
  def track_params
    params.require(:track).permit :location_a, :location_b, :description
  end

  def track_owner?
    @track = Track.find(params[:id])
    if @track.user_id == current_user.id
      true
    else
      false
    end      
  end
end
