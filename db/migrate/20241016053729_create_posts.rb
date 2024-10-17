class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :relationship, null: false  # 関係性をinteger型で保存
      t.jsonb :virtues, null: false, default: []  # 美点をjsonb型で保存

      t.timestamps
    end
  end
end
