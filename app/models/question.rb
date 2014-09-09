class Question < ActiveRecord::Base
  default_scope -> { order(:order)}
  has_many :answers
end
