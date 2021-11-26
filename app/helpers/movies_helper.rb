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
      image_tag movie.avatar.url(:medium)
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
      content_tag(:button, 'Sold out !!!', class: 'btn btn-warning')
    else
      link_to 'Register !', new_movie_registration_path(movie), class: 'btn btn-success'
    end
  end

  def like_or_unlike(liked, movie)
    if liked
      button_to("Unfav \u{1f44e}", movie_like_path(movie, liked),
                method: :delete)
    else
      button_to("Fav \u{1f44d}", movie_likes_path(movie))
    end
  end

  def registered_or_unregistered(movie, registered)
    if registered
      link_to 'Unregister', movie_registration_path(movie, @registered),
              method: :delete, class: 'btn btn-danger',
              data: { confirm: "Are you sure you want to unregister for #{movie.name}" }
    else
      spot_sold_out(movie)
    end
  end

  def admin?(user)
    if user.admin == true
      content_tag(:span, 'Admin', class: 'admin-btn')
    else
      content_tag(:span, 'Member', class: 'member-btn')
    end
  end

  def avaliable(movie, _registrations)
    movie.capacity - movie.registrations.size
  end
end
