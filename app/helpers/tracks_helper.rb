module TracksHelper
  def static_map(track)
    a, b = track.get_coordinates
    image_tag "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&maptype=hybrid\
              &path=color:0x0000ff|#{a[0]},#{a[1]}|#{b[0]},#{b[1]}\
              &markers=#{a[0]},#{a[1]}|#{b[0]},#{b[1]}"
  end
end
