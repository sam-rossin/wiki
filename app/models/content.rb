class Content < ActiveRecord::Base
  belongs_to :page
  default_scope -> { order(created_at: :desc) }
  validates :page_id, presence: true, :unless => :nested
  #workaround for circular dependencies when creating 
  #page and content at same time
  attr_accessor :nested
end
