class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :reponse
  scope :question_order, -> { joins(:question).order("questions.order")}
end
