class Magazine < ApplicationRecord

  validates_presence_of :slug, :name, :alpha_guide

  def self.collection
    Magazine.all.order(alpha_guide: :asc).map { |m| [I18n.t("magazine.name.#{m.slug}"), m.id] }
  end
end
