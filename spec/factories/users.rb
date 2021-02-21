FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { person.first.kanji }
    first_name { person.last.kanji }
    kana_first_name { person.last.katakana }
    kana_last_name { person.first.katakana }
    birthday { '1980/12/30' }
  end
end
