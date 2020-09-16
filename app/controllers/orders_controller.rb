class OrdersController < ApplicationController

  def new
    @address = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def confirm
    @orders = current_customer.orders
      @total_price = calculate(current_customer)

      if  session[:address].length <8
        @address = ShipAddress.find(session[:address])
      end
  end

  def complete
  end

  def create
    @order = Order.new(order_params) #初期化代入
    @order.customer_id = current_customer.id #自身のidを代入
    @order.save #orderに保存

    #order_itmemの保存
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_detail = OrderItem.new #初期化宣言
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.items_tax_included_price = (cart_item.item.unit_price_without_tax*1.1).floor #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
    end #ループ終わり

    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to public_orders_complete_path #thanksに遷移
  end

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
