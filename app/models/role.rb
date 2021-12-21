class Role < ApplicationRecord

  has_many :users

  validates_presence_of :name, :position

  def self.role_collection(user = nil)
    if user.present?
      Role.where('position <= ?', user.role.position).map { |r| [I18n.t("lists.role.#{r.name}"), r.id] }
    else
      Role.all.map { |r| [I18n.t("lists.role.#{r.name}"), r.id] }
    end
  end

  def to_s
    I18n.t("lists.role.#{name}")
  end
end
