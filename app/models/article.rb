class Article < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper
  include Searchable

  belongs_to :classification
  belongs_to :issue
  belongs_to :language, optional: true

  attr_accessor :magazine_id
  
  validates_presence_of :title, :author, :issue_id, :classification_id, :description

  scope :author_contains, ->(name) { where('author ILIKE ?', "%#{name}%") }
  scope :by_article_type, ->(id) { where(classification_id: id) }
  scope :by_language, ->(id) { where(language_id: id) }
  scope :by_magazine, ->(id) { joins(:issue).where(issue: { magazine_id: id }) }
  scope :by_year, ->(year) { joins(:issue).where(issue: { year: year }) }
  scope :for_machines, ->(ids) { where('machine_ids && ARRAY[?]', ids.map(&:to_i)) }
  scope :has_all_tags, ->(ids) { where('tag_ids @> ARRAY[?]', ids.map(&:to_i)) }
  scope :has_text, ->(text) { where('description ILIKE ? OR blurb ILIKE ? OR title ILIKE ?', "%#{text}%", "%#{text}%", "%#{text}%") }
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
    return issue.special unless issue.special.blank?

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

  def author_for_results
    truncate(author, length: 48)
  end

  def description_for_results
    result_string = description&.gsub!('<i>', '')&.gsub!('</i>', '')
    truncate("#{blurb} #{result_string || description}",
             length: 108,
             omission: " ... #{description[-24, 24]}")
  end

  def issue_for_results
    if issue.special.present?
      display_string = "<i>#{issue.magazine}</i> #{issue.date_display} (#{issue.special})"
    else
      display_string = "<i>#{issue.magazine}</i> #{issue.date_display} (Issue #{issue.sequence})"
      unless issue.number.blank?
        display_string += " &ndash; Vol. #{issue&.volume}, No. #{issue&.number}"
      end
    end

    sanitize display_string
  end

  def title_for_results
    truncate(title, length: 85)
  end
end
