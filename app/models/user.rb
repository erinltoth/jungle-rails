class User < ActiveRecord::Base
  has_many :reviews

  validates :email, :uniqueness => {:case_sensitive => false},
                    presence: true
  validates :password, length: { minimum: 8 }
  validates :first_name, :last_name, presence: true

  has_secure_password
end
