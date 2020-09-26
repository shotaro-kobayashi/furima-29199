require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do  
      @user.email = ""    
      @user.valid?     
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに＠がなくては登録できない" do
      @user.email = "kkkkk" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上でなくてはならない" do
      @user.password = "koba5"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "kobakoba"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "名字が必須であること" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "名前が必須であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力しなくてはならない" do
      @user.first_name = "kkk"
      @user.last_name = "kkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナが、名字で必須であること" do
      @user.last_furi = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furi can't be blank", "Last furi 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナが、名前で必須であること" do
      @user.first_furi = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First furi can't be blank", "First furi 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_furi = "kkk"
      @user.last_furi = "kkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furi 全角文字を使用してください", "First furi 全角文字を使用してください")
    end

    it "dateが空だと登録できない" do
      @user.date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end

  end
end