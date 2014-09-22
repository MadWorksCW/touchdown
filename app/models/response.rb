class Response < ActiveRecord::Base
  has_many :answers, dependent: :delete_all
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates :name, :email, presence: true


  def populate_answers
    Question.all.each do |q|
      answers << Answer.new(question_id: q.id)
    end
    answers
  end

  def score_for(user)
    scores.where(user_id: user).first
  end

  def total_score
    scores.joins(:ratings).sum('ratings.rating')
  end

  def average_score
    total_score / scores.count.to_f
  end

end
