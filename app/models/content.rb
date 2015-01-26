class Content < ActiveRecord::Base
  belongs_to :page
  default_scope -> { order(created_at: :desc) }
  validates :page_id, presence: true
end
