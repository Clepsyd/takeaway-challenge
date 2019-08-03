require 'order'

class Restaurant

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def new_order(order = Order.new)
    @order = order
  end

end