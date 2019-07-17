# README

## Background

Have you ever noticed that your credit cards normally start with a 4 or 5? That's because there's a pattern.
We'll implement the [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) to check if a credit card number is valid.

## Specs

There are two methods to implement. First, code a method,
`visa_or_mastercard?` which will return a string based on the `card` argument they receive.

One thing we need to know first is that if our credit card number starts with a `5`, then it was issued by Mastercard, and if starts with a `4` then it was issued by Visa. Check inside your wallet!

```ruby
visa_or_mastercard?("4242 4242 4242 4242")
# => Visa

visa_or_mastercard?("5252 5252 5252 5252")
# => Mastercard
```

Second, code a method, `valid_card?`, which will return a string on the `card` argument they receive.

Quoting Wikipedia, here's the algorithm:

1. From the rightmost digit, which is the check digit, and moving left, double the value of every second digit. If the result of this doubling operation is greater than 9 (e.g., 8 × 2 = 16), then add the digits of the product (e.g., 16: 1 + 6 = 7, 18: 1 + 8 = 9) or alternatively subtract 9 from the product (e.g., 16: 16 - 9 = 7, 18: 18 - 9 = 9).
1. Take the sum of all the digits
1. If the total modulo 10 is equal to 0 (if the total ends in zero) then the number is valid according to the Luhn formula; else it is not valid.

This is what you should get:

```ruby
valid_card?("4242 4242 4242 4242")
# => correct

valid_card?("4242 4242 4242 4241")
# => wrong
```
