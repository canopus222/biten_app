class Post < ApplicationRecord
  belongs_to :user
  # Enumで関係性を定義
  enum relationship: { 私: 0, 家族: 1, 親戚: 2, 友人: 3, その他: 4 }

  validates :name, presence: true, length: { maximum: 50 }
  validates :relationship, presence: true

  # 美点は必須で、10個あることを確認し、各美点は100文字以内
  validate :validate_virtues

  def validate_virtues
    if virtues.is_a?(Array) && virtues.length == 10
      virtues.each_with_index do |virtue, index|
        if virtue.blank?
          errors.add(:virtues, "美点#{index + 1}を入力してください")
        elsif virtue.length > 100
          errors.add(:virtues, "美点#{index + 1}は100文字以内で入力してください")
        end
      end
    else
      errors.add(:virtues, '美点は10個必要です')
    end
  end
end
