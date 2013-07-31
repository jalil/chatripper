class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string      :actor
      t.string       :action
      t.string       :receiver
      t.timestamps
    end
  end
end
