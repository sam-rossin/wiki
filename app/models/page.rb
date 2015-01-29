class Page < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents
  validates :name,  presence: true, length: { maximum: 50 },
                                    uniqueness: true
                                    
  def self.search(search)
    if search
      wildcard_search = "%#{search}%"
      if Rails.env.production?
        order(:name).where("name ILIKE :search", search: wildcard_search)
      else
        order(:name).where("name LIKE :search", search: wildcard_search)
      end
    else
      order(:name).all
    end
  end
end
