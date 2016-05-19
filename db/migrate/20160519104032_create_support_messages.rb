class CreateSupportMessages < ActiveRecord::Migration
  def change
    create_table :support_messages do |t|
      t.string :email
      t.text :content

      t.timestamps null: false
    end
  end
end
