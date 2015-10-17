FactoryGirl.define do
  sequence :title do |n|
    "Game of Thrones - Season #{n}"
  end

  factory :list do
    title { FactoryGirl.generate :title }
    opened false
  end
end
