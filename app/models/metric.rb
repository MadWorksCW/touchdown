class Metric < ActiveRecord::Base
  default_scope -> {order(:name)}
end
