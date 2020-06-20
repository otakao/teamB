FactoryBot.define do

  factory :user do
    id                      {"1"}
    nickname                {"hoge"}
    email                   {"aaaaaaaa@gmail.com"}
    password                {"Aaaaaaaa1"}
    encrypted_password      {"Aaaaaaaa1"}
    last_name               {"ほげ"}
    first_name              {"ほげ"}
    last_name_furigana      {"ほげ"}
    first_name_furigana     {"ほげ"}
    birthday                {"1990-06-06"}
    tel                     {""}

  end
end