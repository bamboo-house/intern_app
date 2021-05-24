require 'rails_helper'

describe RegGroup do
  #バリデーションのテスト
  describe "validation" do
    #団体名があれば有効な状態であること
    it "is valid with group_name" do
      data = RegGroup.new(group_name: "団体A")
      expect(data).to be_valid
    end

    # 団体名がなければ無効な状態であること
    it "is invalid without group_name" do
      data = RegGroup.new(group_name: nil)
      data.valid?
      expect(data.errors[:group_name]).to include("can't be blank")
    end

    #団体名が50文字以上なら無効であること
    it "is invalid with 51 charactors group_name or more" do
      data = RegGroup.new(group_name: "A"*51)
      data.valid?
      expect(data.errors[:group_name]).to include("is too long (maximum is 50 characters)")
    end
  end
end