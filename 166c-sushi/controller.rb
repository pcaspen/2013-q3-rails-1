require '../dvc-sinatra.rb'

get "/" do
  halt erb(:main)
end

get "/place_order" do
  @dishes = Dish.order(:id).all
  halt erb(:place_order)
end

post "/place_order" do
  order = Order.new
  order.table_number = params[:table_number]
  order.total_price = 0.00
  order.save!

  Dish.all.each do |dish|
    quantity = params["quantity_for_dish_#{dish.id}"]
    if quantity != ""
      line_item = LineItem.new
      line_item.dish_id = dish.id
      line_item.order_id = order.id
      line_item.quantity = quantity
      line_item.line_price = dish.price * quantity.to_i
      order.total_price = order.total_price + line_item.line_price
      line_item.save!
    end  
  end
  
  order.save!

  redirect "/"
end

get "/orders" do
  @orders = Order.order(:id).all
  halt erb(:orders)
end

get "/dishes" do
  @dishes = Dish.order(:id).all
  halt erb(:dishes)
end
