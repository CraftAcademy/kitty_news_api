FactoryBot.define do
  factory :article do
    title { "MyTitle" }
    lead { "MyLead" }
    body { "MyBody" }
    association :category
  end
end
