class Movie < ActiveRecord::Base
  
  def flop?
    total_gross.blank? || total_gross < 50000000 
  end

  def self.released
    where("released_on < ?", Time.now).order(released_on: :desc)
  end

  # def self.hit_movies
  #   where("total_gross > ?", 300000000).order(total_gross: :desc)
  # end

  # def self.flop_movies
  #   where("total_gross < ?", 50000000).order(:total_gross)
  # end

  # def self.recently_added_movies
  #   order(created_at: :desc)
  # end
end
