module RegistrationsHelper
  def register_check(_movie, registration)
    if registration.exists?
      # "Registrations for #{movie.name}"
      registration.name

    else
      'NO ONE REGISTERED FOR THIS MOVIE YET'
    end
  end
end
