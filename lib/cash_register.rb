require 'pry'
class CashRegister

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  attr_accessor :discount, :total, :last_transaction_total
  attr_reader :items

  def add_item(title, price, quantity = 1)
    #binding.pry
    quantity.times do
      @items << title
    end
    self.last_transaction_total = quantity*price
    self.total += quantity*price
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total * (1 - self.discount/100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction_total
  end

end