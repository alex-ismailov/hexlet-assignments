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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
