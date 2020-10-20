# == Schema Information
#
# Table name: tasks
#
#  id               :bigint           not null, primary key
#  task_description :text             not null
#  task_name        :string           not null
#  task_term        :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  board_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :task_description, presence: true

  belongs_to :board
  belongs_to :user
end
