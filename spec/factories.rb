FactoryGirl.define do
  factory :post do
    title "Hello"
    content  "Hello World"
  end

  factory :friend do
    name  "Hello"
    email "example@ex.com"
    user_id "67595179"
  end

  factory :credit do
    miktar 1000.0
    durum "not_paid"
end
end


