class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :kana_first_name, presence: true, format: { with: KATAKANA_REGEXP }
  validates :kana_last_name, presence: true, format: { with: KATAKANA_REGEXP }



end
