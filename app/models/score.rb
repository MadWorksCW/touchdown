class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  has_many :ratings
  
  accepts_nested_attributes_for :ratings

  def populate_ratings
    Metric.all.each do |metric|
      ratings.build(metric: metric)
    end
  end

  def rating_total
    ratings.sum(:rating)
  end
end
