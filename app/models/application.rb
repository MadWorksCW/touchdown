class Application < ActiveRecord::Base
  has_many :questions, dependent: :delete_all
  has_many :metrics, dependent: :delete_all
  has_many :responses, dependent: :delete_all

  scope :open, -> { where("opened_at < ? AND (closed_at > ? OR closed_at IS NULL)", Time.now, Time.now)}

  def closed?
    !!closed_at
  end

  def open?
    !!opened_at
  end

  def active?
    open? && !closed?
  end

  def scoring_completion
    tuples = User.joins("LEFT JOIN scores on scores.user_id = users.id INNER JOIN responses on scores.response_id = responses.id")
        .where(responses: {application_id: self.id})
        .select("users.*, count(scores.id) as score_count")
        .group('users.id')
    tuples.collect do |user|
      [user.display_name, user.score_count]
    end
  end

  def duplicate!
    Application.transaction do
      new_application = Application.create!(name: name + " (copy)")
      questions.each do |q|
        new_application.questions << Question.new(q.attributes.slice('order', 'text'))
      end
      metrics.each do |m|
        new_application.metrics << Metric.new(m.attributes.slice('description', 'name'))
      end
      new_application
    end

  end
end
