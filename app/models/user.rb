class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_movies, through: :favourites, source: :movie

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, 
  					format: /\A\S+@\S+\z/,
  					uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username, presence: true,
  						format: /\A[A-Z0-9]+\z/i,
  						uniqueness: { case_sensitive: false }

  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }

  def gravatar_id
  	Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
end
