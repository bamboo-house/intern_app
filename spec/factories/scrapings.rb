FactoryBot.define do
  factory :reg_group do
    group_name {"bamboo"}
  end

  factory :scraping do
    group_name {"bamboo"}
    event_title {"eat takenoko"}
    link_url {"takebamboo@example.com"}
  end
end
