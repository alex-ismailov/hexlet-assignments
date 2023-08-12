# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status_id   :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_tasks_on_status_id  (status_id)
#  index_tasks_on_user_id    (user_id)
#
# Foreign Keys
#
#  status_id  (status_id => statuses.id)
#  user_id    (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status

  validates :name, :description, :user_id, :status_id, presence: true
end
