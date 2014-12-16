class Metric < ActiveRecord::Base
  default_scope -> {order(:name)}

  belongs_to :application
end
