FactoryBot.define do
  
  factory :user do
    nickname              {"kkkkkkk"}
    # email                 {"kkk@gmail.com"}
    password              {"aaaaaaaa"}
    password_confirmation {"aaaaaaaa"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_furigana   {"やまだ"}
    last_name_furigana    {"たろう"}
    birthday              {"1981/01/10"}
    sequence(:email) {Faker::Internet.email}
  end

end