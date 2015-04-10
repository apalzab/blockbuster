class User < ActiveRecord::Base

# Associations
  has_many :purchases

# Validations
    validates :nickname, presence: true, uniqueness: true
end
