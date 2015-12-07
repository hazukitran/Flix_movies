class Favourite < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
end
