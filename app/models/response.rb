class Response < ActiveRecord::Base
  has_many :answers
  accepts_nested_attributes_for :answers
  validates :name, :email, presence: true

  def populate_answers
    Question.all.each do |q|
      answers << Answer.new(question_id: q.id)
    end
    answers
  end
end
