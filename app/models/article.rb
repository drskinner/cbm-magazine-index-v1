class Article < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
  include Searchable

  belongs_to :classification
  belongs_to :issue
  belongs_to :language, optional: true
  has_and_belongs_to_many :machines
  has_and_belongs_to_many :tags

  attr_accessor :magazine_id
  
  validates_presence_of :title, :author, :issue_id, :classification_id, :description

  scope :by_magazine_id, ->(id) { joins(:issue).where(issue: { magazine_id: id }) }
  scope :by_year, ->(year) { joins(:issue).where(issue: { year: year }) }

  def to_s
    title
  end

  # I realize these belong in a decorator... :)
  def classification_id_display
    classification.name
  end

  def issue_id_display
    sanitize (issue.date_display +
        (" &ndash; Vol. #{issue.volume}, No. #{issue.number}" unless issue.number.blank?))
  end

  def language_id_display
    language&.name
  end

  def machine_ids_display
    machines&.pluck(:name).join(', ')
  end
  
  def magazine_id_display
    issue.magazine.to_s
  end

  def tag_ids_display
    tags&.pluck(:name).join(', ')
  end
end
