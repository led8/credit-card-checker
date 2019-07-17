module CardsHelper
  def display_card!(card)
    if visa_or_mastercard?(card) == 'no card matched !'
      result = visa_or_mastercard?(card)
    end

    if valid_card?(card) == 'correct'
      card_type = "Your card is a #{visa_or_mastercard?(card)} "
      valid_card = "and this is a <span class='text-success'>#{valid_card?(card)}</span> card !"
      result = ("#{card_type}#{valid_card}").html_safe
    else
      card_type = "Your card is probably a #{visa_or_mastercard?(card)} "
      valid_card = "but this is a <span class='text-danger'>#{valid_card?(card)}</span> card !"
      result = ("#{card_type}#{valid_card}").html_safe
    end
    return result
  end

  def visa_or_mastercard?(card)
    if card.delete(' ').start_with?('4')
      return 'Visa'
    elsif card.delete(' ').start_with?('5')
      return 'Mastercard'
    else
      return 'No card matched !'
    end
  end

  def valid_card?(card)
    return false if card.empty?

    arr_card = card.delete(' ').split('').map! { |digit| digit.to_i }

    even_index = arr_card.values_at(-1, -3, -5, -7, -9, -11, -13, -15)
    odd_index = arr_card.values_at(-2, -4, -6, -8, -10, -12, -14, -16)

    odd_index.map! { |digit| digit * 2 }.map! { |digit| digit > 9 ? digit.digits.sum : digit }

    sum = even_index.sum + odd_index.sum

    sum.modulo(10).zero? ? 'correct' : 'wrong'
  end
end
