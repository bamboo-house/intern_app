require 'rails_helper'

describe Scraping do
  #バリデーションのテスト
  describe "validation" do
    #団体名があれば有効な状態であること
    it "is valid with group_name" do
      expect(build(:scraping)).to be_valid
    end

    # 団体名がなければ無効な状態であること
    it "is invalid without group_name" do
      data = build(:scraping, group_name: nil)
      data.valid?
      expect(data.errors[:group_name]).to include("can't be blank")
    end

    #団体名が50文字以上なら無効であること
    it "is invalid with 51 charactors group_name or more" do
      data = build(:scraping, group_name: "bamboo"*51)
      data.valid?
      expect(data.errors[:group_name]).to include("is too long (maximum is 50 characters)")
    end

    #タイトルが255文字以上なら無効であること
    it "is invalid with 256 charactors event_title or more" do
      data = build(:scraping, event_title: "eat takenoko"*256)
      data.valid?
      expect(data.errors[:event_title]).to include("is too long (maximum is 255 characters)")
    end
  end

  # 関連付けのテスト
  describe 'Association' do
    it 'update reg_group_id using self.update_reg_group_id method' do
      reg_data = RegGroup.create(group_name: "bamboo")
      create(:scraping)
      
      #関連付けるメソッド
      Scraping.update_reg_group_id

      scraping_data = Scraping.find_by(group_name: "bamboo")
      expect(scraping_data.reg_group_id).to eq reg_data.id
    end
  end
end
