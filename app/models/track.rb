class Track < ActiveRecord::Base
  validates :location_a, presence: true
  validates :location_b, presence: true

  before_save :calculate_distance
  
  def get_coordinates
    return Geocoder.coordinates(self.location_a), Geocoder.coordinates(self.location_b)
  end

  protected
    def calculate_distance
      a, b = self.get_coordinates
      self.distance = Geocoder::Calculations.distance_between(a, b).round(2)
    end
end
