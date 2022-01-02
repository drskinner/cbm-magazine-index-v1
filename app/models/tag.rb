class Tag < ApplicationRecord

  has_and_belongs_to_many :articles
  
  validates_presence_of :name

  def self.collection
    Tag.all.order(alpha_guide: :asc).map { |t| [t.name, t.id] }
  end

  def to_s
    name
  end
end
