# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  prefix         :string(255)
#  products_count :integer          default(0)
#  parent_id      :integer
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
