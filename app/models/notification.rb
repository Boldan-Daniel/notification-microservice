class Notification < ApplicationRecord
  belongs_to :client, foreign_key: 'source_app', primary_key: 'source_app'

  validates_presence_of :phone, :body, :source_app
  validates :phone, format: { with: /\A[+-]?\d+\z/, message: 'only allows number' },
                    length: { is: 10 }
  validates :body, length: { maximum: 160 }
end
