class Article < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
  include Searchable

  belongs_to :classification
  belongs_to :issue
  belongs_to :language, optional: true

  attr_accessor :magazine_id
  
  validates_presence_of :title, :author, :issue_id, :classification_id, :description

  scope :by_magazine_id, ->(id) { joins(:issue).where(issue: { magazine_id: id }) }
  scope :by_year, ->(year) { joins(:issue).where(issue: { year: year }) }

  def to_s
    title
  end

  def machine_ids=(machine_ids)
    super(machine_ids.reject(&:blank?))
  end

  def tag_ids=(tag_ids)
    super(tag_ids.reject(&:blank?))
  end

  # I realize these belong in a decorator... :)
  def classification_id_display
    classification.name
  end

  def description_display
    sanitize description
  end

  def issue_id_display
    display_string = "#{issue.date_display} (#{issue.sequence})"
    unless issue.number.blank?
      display_string += " &ndash; Vol. #{issue&.volume}, No. #{issue&.number}"
    end
    sanitize display_string
  end

  def language_id_display
    language&.name
  end

  def machine_ids_display
    Machine.where(id: machine_ids).pluck(:name).join(', ')
  end
  
  def magazine_id_display
    issue.magazine.to_s
  end

  def tag_ids_display
    Tag.where(id: tag_ids).pluck(:name).join(', ')
  end
end
