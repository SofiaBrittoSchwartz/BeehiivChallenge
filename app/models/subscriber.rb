class Subscriber < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}\z/, message: "The email provided isn't properly formatted." }, uniqueness: true
  validates :name, presence: true
  validates :isSubscribed, presence: true, inclusion: {in: [true, false]}
end
