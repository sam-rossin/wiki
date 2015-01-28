class Page < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents
  validates :name,  presence: true, length: { maximum: 50 },
                                    uniqueness: true
end
