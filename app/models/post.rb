class Post < ApplicationRecord
  belongs_to :user
  enum relationship: { 私: 0, 家族: 1, 親戚: 2, 友人: 3, その他: 4 }

  validates :name, presence: true, length: { maximum: 50 }
  validates :relationship, presence: true
  validates :virtue_1, :virtue_2, :virtue_3, :virtue_4, :virtue_5, :virtue_6, :virtue_7, :virtue_8, :virtue_9, :virtue_10, presence: true

end
