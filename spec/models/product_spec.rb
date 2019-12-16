require 'rails_helper'
describe Product do

  describe '#create' do
    context 'can not save' do
      it "is invalid without a name" do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end
  
      it "is invalid without a information" do
        product = build(:product, information: nil)
        product.valid?
        expect(product.errors[:information]).to include("can't be blank")
      end
  
      it "is invalid without a condition" do
        product = build(:product, condition: nil)
        product.valid?
        expect(product.errors[:condition]).to include("can't be blank")
      end
  
      it "is invalid without a shipping_charge" do
        product = build(:product, shipping_charge: nil)
        product.valid?
        expect(product.errors[:shipping_charge]).to include("can't be blank")
      end
  
      it "is invalid without a days_before_skipment" do
        product = build(:product, days_before_skipment: nil)
        product.valid?
        expect(product.errors[:days_before_skipment]).to include("can't be blank")
      end
  
      it "is invalid without a price" do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

    end

  end
end