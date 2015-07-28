class PagesController < ApplicationController
  def home
    @question = ""
    if !params[:content].nil?
      @cords = Hash.new
      result = Geocoder.search(params[:content])
      unless result[0].nil?
        @cords[:lat] = result[0].geometry["location"]["lat"]
        @cords[:lng] = result[0].geometry["location"]["lng"]
      end
    end
  end
end
