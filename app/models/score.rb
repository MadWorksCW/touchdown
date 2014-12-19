class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  has_many :ratings, dependent: :destroy

  accepts_nested_attributes_for :ratings

  def populate_ratings
    response.application.metrics.all.each do |metric|
      ratings.build(metric: metric)
    end
  end

  def total
    ratings.sum(:rating)
  end
end
