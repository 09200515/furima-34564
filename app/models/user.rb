class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :birthday
    with_options format: { with: KATAKANA_REGEXP } do
      validates :kana_first_name
      validates :kana_last_name
    end
  end

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/



end
