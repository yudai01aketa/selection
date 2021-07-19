class Category < ApplicationRecord
  has_many :ideas, dependent: :destroy
  before_save :convert_column_name
  attr_accessor :category_name

  validates :category_name, presence: true

  def convert_column_name
    self.name = category_name
  end
end
