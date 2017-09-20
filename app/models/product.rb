# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text(65535)
#  inventory    :integer
#  price        :decimal(7, 2)
#  restocked_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  qty_sold     :integer
#  ref_num      :string(255)
#  style_id     :integer
#  category_id  :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_ref_num      (ref_num)
#  index_products_on_style_id     (style_id)
#

class Product < ApplicationRecord

  belongs_to :category, class_name: 'Category', foreign_key: 'category_id', touch: true

  default_scope { order("name ASC") }

  scope :recent, lambda { where(["created_at >= ?", 1.year.ago]) }

  after_save :announce_save

  # def prefix
  #   category.prefix
  # end
  delegate :prefix, to: :category, allow_nil: true

  def full_ref_num
    "#{prefix} - #{ref_num}"
  end

  private

    def announce_save
      puts "*** Saved! ***"
    end
end
