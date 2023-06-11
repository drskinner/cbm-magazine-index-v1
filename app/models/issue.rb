class Issue < ApplicationRecord
  include Searchable

  belongs_to :magazine
  has_many :articles
  
  validates_presence_of :year

  scope :by_magazine_id, ->(id) { where(magazine_id: id) }
  scope :by_year, ->(year) { where(year: year) }

  def to_s
    "#{magazine.to_s} #{month_display} #{year} (#{sequence})"
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

  def friendly_name
    return special if special.present?

    I18n.t(
      "issue.friendly_name.#{magazine.slug}",
      volume: volume,
      number: number,
      sequence: sequence,
      month_name: month.present? ? Date::MONTHNAMES[month] : '',
      year: year
    ).squeeze(' ')
  end
end
