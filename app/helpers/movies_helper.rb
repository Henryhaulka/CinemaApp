module MoviesHelper
  def price(movie)
    if movie.nothing?
      'Free'
    elsif movie.zero?
      'Free '
    else
      number_to_currency(movie.price, precision: 0)
    end
  end

  def day_time(movie)
    movie.viewing_date.strftime('%a, %d %B %Y at %I:%M %P')
  end

  def for_avatar_medium(movie)
    if movie.avatar?
      image_tag @movie.avatar.url(:medium)
    else
      image_tag 'default_avatar.jpg'
    end
  end

  def for_avatar_small(movie)
    if movie.avatar?
      image_tag movie.avatar.url(:small)
    else
      image_tag('default_avatar.jpg', size: '150x100')
    end
  end

  def spot_sold_out(movie)
    if movie.sold_out?
      content_tag(:button, 'Sold out !!!', class: 'btn btn-warning' )
    else
      link_to 'Register !', new_movie_registration_path(movie), class:"btn btn-success"
    end
  end
  
end


 