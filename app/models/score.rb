class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  has_many :ratings

  def rating_total
    ratings.sum(:rating)
  end
end
