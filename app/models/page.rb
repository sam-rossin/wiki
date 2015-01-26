class Page < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
end
