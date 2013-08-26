require '../dvc-sinatra.rb'

# TODO: Write this
get "/" do
	@tables = Table.order(:id).all 
	@orders = Order.order("id desc").all
  halt erb(:main)
end

post "/" do
	Table.all.each do |table|
	  if params[:commit] == "Occupy table #{table.id}"
	  	@table = Table.find(table.id)
	  	@table.occupied = true
	  	@table.save!

		 	@order = Order.where(table_id: table.id).first
		  if @order == nil
			  @order = Order.new
			  @order.table_id = table.id
			  @order.total_price = BigDecimal(0)
			  @order.paid_yet = false
			  @order.save!
			end 
		end
	end		
	redirect "/order/#{@order.id}" 
end

get "/order/:id" do
	@order = Order.find(params[:id])
	table_id = @order.table_id
	@table = Table.find(table_id)
	@order_lines = OrderLine.where(table_id: table_id).all
  halt erb(:order)
end

post "/order/:id" do
	@order = Order.find(params[:id])
	table_id = @order.table_id
	@table = Table.find(table_id)
	@order_lines = OrderLine.where(table_id: table_id).all
	
	if params[:commit] == "Add Entree"
		@new_order_line = OrderLine.new 
		@new_order_line.order_id = @order.id 
		@new_order_line.table_id = @table.id 
		@new_order_line.chair_number = params[:chair_number]
		@new_order_line.entree_id = params[:entree]
		@order.total_price = @order.total_price + @new_order_line.entree.price

		@new_order_line.save!
    @order.save!
    redirect "/order/#{@order.id}"
	end
  
	if params[:commit] == "Pay and Close"
    @order.paid_yet = true
    @table.occupied = false
    @order.save!
    @table.save!
    redirect "/"
	end	
 end