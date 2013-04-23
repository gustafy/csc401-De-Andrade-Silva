class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.string :description
      t.boolean :public, :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
