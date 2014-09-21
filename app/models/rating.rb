class Rating < ActiveRecord::Base
  belongs_to :score
  belongs_to :metric
end
