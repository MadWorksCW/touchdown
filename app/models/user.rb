class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :scores, dependent: :destroy

  def display_name
    if first_name.present?
      "#{first_name} #{last_name.first}"
    else
      email
    end
  end
end
