# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :educations, class_name: 'ResumeEducation', dependent: :destroy, inverse_of: :resume
  has_many :works, class_name: 'ResumeWork', dependent: :destroy, inverse_of: :resume

  accepts_nested_attributes_for :educations, :works, allow_destroy: true
  # END
end
