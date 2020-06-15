class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :user
      t.string :podcast
      t.integer :rating
    end
  end
end
