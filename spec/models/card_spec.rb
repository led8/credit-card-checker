require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'should persist a card' do
    Card.create(credit_card_number: 123456789)

    expect(Card.count).to eq(1)
  end
end
