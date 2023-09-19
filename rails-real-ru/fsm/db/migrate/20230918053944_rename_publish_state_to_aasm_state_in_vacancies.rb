class RenamePublishStateToAasmStateInVacancies < ActiveRecord::Migration[7.0]
  def change
    rename_column :vacancies, :publish_state, :aasm_state
  end
end
