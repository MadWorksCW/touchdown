class Response < ActiveRecord::Base
  has_many :answers
  accepts_nested_attributes_for :answers

  def populate_answers
    Question.all.each do |q|
      answers << Answer.new(question_id: q.id)
    end
    answers
  end
end
