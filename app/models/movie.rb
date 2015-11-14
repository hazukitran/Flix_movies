class Movie < ActiveRecord::Base
  def flop?
    total_gross < 50000000 || total_gross.blank?
  end
end
