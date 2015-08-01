class PagesController < ApplicationController
  def home; end

  def demo
    @demo_search = ""
    if (params[:location_a].present? && params[:location_b].present?)
      a = params[:location_a]
      b = params[:location_b]
      coordinates_a, coordinates_b = Track.new(location_a: a, location_b: b).get_coordinates
      unless (coordinates_a.nil? && coordinates_b.nil?)
        @distance = Geocoder::Calculations.distance_between(coordinates_a, coordinates_b).round(2)
        @track = Track.new(location_a: a, location_b: b)
      end
    end
  end
end
