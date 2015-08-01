module TracksHelper
  def static_map(track, position)
    a, b = track.get_coordinates
    image_tag "http://maps.google.com/maps/api/staticmap?size=550x450&sensor=false&maptype=hybrid\
              &path=color:0x0000ff|#{a[0]},#{a[1]}|#{b[0]},#{b[1]}\
              &markers=color:blue%7Clabel:A%7C#{a[0]},#{a[1]}\
              &markers=color:red%7Clabel:B%7C#{b[0]},#{b[1]}", class: "img-responsive #{position}-block"
  end
end
