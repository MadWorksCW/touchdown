class Response < ActiveRecord::Base
  has_many :answers, dependent: :delete_all
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates :name, :email, presence: true
  belongs_to :application


  def populate_answers
    application.questions.each do |q|
      answers << Answer.new(question_id: q.id)
    end
    answers
  end

  def score_for(user)
    scores.where(user_id: user).first
  end

  def total_score(metric=nil)
    query = valid_scores
    if metric
      query = query.where(ratings: {metric_id: metric.id})
    end
    query.sum('ratings.rating')
  end

  def valid_scores
    scores.joins(:ratings).where("ratings.rating is not null").uniq
  end

  def average_score(metric=nil)
    total_score(metric) / valid_scores.count.to_f
  end

end
