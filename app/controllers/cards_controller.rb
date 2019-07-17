class CardsController < ApplicationController
  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to card_path(@card)
    else
      render :index
    end
  end

  def show
    @card = Card.find(params[:id])

    render :show
  end

  private

  def card_params
    params.require(:card).permit(:credit_card_number)
  end
end
