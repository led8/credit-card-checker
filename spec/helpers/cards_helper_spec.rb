require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CardsHelper. For example:
#
# describe CardsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe CardsHelper, type: :helper do
  describe "visa_or_mastercard?" do
    it "should return `no card matched !` if card number starts with uncorrect integer" do

      expect(helper.visa_or_mastercard?("9485888168897969")).to eq('No card matched !')
    end

    it "should return `visa` if card number starts with a 4" do

      expect(helper.visa_or_mastercard?("4485888168897969")).to eq('Visa')
    end

    it "should return `visa` for a valid card number ignoring any spaces" do

      expect(helper.visa_or_mastercard?("  4485 8881 6889  7969")).to eq('Visa')
    end

    it "should return `mastercard` if card number starts with a 5" do

      expect(helper.visa_or_mastercard?("5281148957047240")).to eq('Mastercard')
    end

    it "should return `mastercard` for a valid card number ignoring any spaces" do

      expect(helper.visa_or_mastercard?("  5281 1489 5704  7240")).to eq('Mastercard')
    end
  end

  describe "valid_card?" do
    it "should return false when given an empty card number" do
      expect(helper.valid_card?("")).to eq(false)
    end

    it "should return `correct` for the default credit card number of Stripe - 4242 4242 4242 4242" do
      expect(helper.valid_card?("4242 4242 4242 4242")).to eq("correct")
    end

    it "should return `correct` for a valid credit card number no matter how many spaces between numbers" do
      expect(helper.valid_card?("4242 4242  42424242")).to eq("correct")
    end

    it "should return `wrong` for the invalid credit card number: 5555 5555 5555 5555" do
      expect(helper.valid_card?("5555 5555 5555 5555")).to eq("wrong")
    end
  end
end
