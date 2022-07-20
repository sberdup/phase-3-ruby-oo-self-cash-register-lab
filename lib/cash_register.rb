require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_item, :items
    def initialize(discount = 'none')
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @last_item = {:quantity => quantity, :price => price}
        #adds each item to all_items according to quantity
        quantity.times do 
            @items << title
        end
    end

    def apply_discount
        unless @discount == 'none'
            @total *= (1 - @discount.to_f / 100)
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_item[:price] * @last_item[:quantity]
    end
end