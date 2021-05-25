require 'rails_helper'

feature "Articles", type: :feature do
  before do
    # データ作成
    RegGroup.create(group_name: "bamboo")
    Scraping.create(group_name: "bamboo", event_title: "eat takenoko", link_url: "takebamboo@example.com", reg_group_id: 1)
  end

  #indexビューにデータが表示されていれば有効
  scenario 'check the index view' do
    @data = Scraping.where.not(reg_group_id: nil)
    visit root_path
    expect(page).to have_selector 'p.group-name', text: 'bamboo'
    expect(page).to have_link 'eat takenoko'
  end
end
