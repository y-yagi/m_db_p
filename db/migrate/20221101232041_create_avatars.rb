class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
