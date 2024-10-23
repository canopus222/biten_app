class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :relationship, null: false  # 関係性をinteger型で保存
      # 新しくstringカラムを10個追加（美点を10個保存）
      10.times do |i|
        t.string "virtue_#{i + 1}", null: false
      end

      t.timestamps
    end
  end
end
