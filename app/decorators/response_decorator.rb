class ResponseDecorator < Draper::Decorator
  delegate_all

  def total_score
    total = model.score_for(h.current_user).try(:total)
    if total
      "(#{total})"
    else
      ""
    end
  end
end