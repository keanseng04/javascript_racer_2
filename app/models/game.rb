class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players, :through => :rounds
  validates :url, uniqueness: true

end
