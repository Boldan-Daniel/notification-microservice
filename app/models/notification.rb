class Notification < ApplicationRecord
  validates_presence_of :phone, :body, :source_app
  validates :phone, format: { with: /\A[+-]?\d+\z/, message: 'only allows number' },
                    length: { is: 10 }
  validates :body, length: { maximum: 160 }
end
