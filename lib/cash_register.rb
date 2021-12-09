require "pry"

class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :last_item_price

    def initialize (discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(title,price,quantity=1)
        self.total += price * quantity
        quantity.times{
           @items = self.items.push(title) 
        }
        @last_item_price = price * quantity
    end
    def apply_discount
        
        if self.discount
            self.total *= Float(100-self.discount)/100
            "After the discount, the total comes to $#{self.total.to_int}."
        else 
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.items.pop 
        @total -= @last_item_price
       binding.pry
    end
   
end
