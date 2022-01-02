class Issue < ApplicationRecord
  include Searchable

  belongs_to :magazine
  has_many :articles
  
  validates_presence_of :year

  scope :by_magazine_id, ->(id) { where(magazine_id: id) }
  scope :by_year, ->(year) { where(year: year) }

  def to_s
    "#{magazine.to_s} #{month_display} #{year}"
  end

  def date_display
    "#{month_display[0..2]} #{year}"
  end

  def magazine_id_display
    magazine.to_s
  end

  def month_display
    month.blank? ? '' : Date::MONTHNAMES[month]
  end

  def self.month_collection
    collection = []
    Date::MONTHNAMES.each_with_index { |m, i| collection << [m, i] unless m.nil? }
    collection
  end
end
