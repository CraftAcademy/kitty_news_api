FactoryBot.define do
  factory :article do
    title { "MyTitle" }
    lead { "MyLead" }
    body { "MyBody" }
    association :category
    association :author, factory: :journalist
  end
end
