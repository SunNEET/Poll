class AddPollIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :poll_id, :integer
  end
end
