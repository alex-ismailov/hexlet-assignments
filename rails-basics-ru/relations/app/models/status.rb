# frozen_string_literal: true

# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Status < ApplicationRecord
  # BEGIN
  has_many :tasks

  validates :name, presence: true
  # END
end
