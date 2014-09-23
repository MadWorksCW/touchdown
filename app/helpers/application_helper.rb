module ApplicationHelper
  def score(float)
    if float.nil? || float.nan?
      "-"
    else
      number_with_precision(float)
    end
  end
end
