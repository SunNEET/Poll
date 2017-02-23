class QuestionsBelongsToPoll < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :poll_id, :integer
  end
end
