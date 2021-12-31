class Article < ApplicationRecord

  belongs_to :classification
  belongs_to :issue
  belongs_to :language
  has_and_belongs_to_many :machines
  has_and_belongs_to_many :tags

  attr_accessor :magazine_id
  
  validates_presence_of :title, :author, :issue_id, :classification_id, :description

  def to_s
    title
  end
end
