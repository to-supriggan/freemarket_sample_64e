require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nick_name" do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a encrypted_password" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    it "is invalid without a kana_name" do
      user = build(:user, kana_name: nil)
      user.valid?
      expect(user.errors[:kana_name]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a payment_method" do
      user = build(:user, payment_method: nil)
      user.valid?
      expect(user.errors[:payment_method]).to include("can't be blank")
    end

    # it "is invalid with a duplicate email address" do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end
  end
end