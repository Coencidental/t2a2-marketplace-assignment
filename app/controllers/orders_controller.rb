class OrdersController < ApplicationController
  require 'stripe'

  def new
    @item = Item.find_by(id: params[:item_id])
    
    Stripe.api_key = 'sk_test_MiCO2mk8qLDSu2k0i5Wmhyrq005VJBZQVB'
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @item.name,
        description: "Posted by #{@item.bucket.user.username}",
        amount: (@item.price * 100).to_i,
        currency: 'aud',
        quantity: 1
      }],
      success_url: 'http://localhost:3000/orders/' + @item.id.to_s + '/complete',
      cancel_url: 'http://localhost:3000/orders/cancel'
    )
  end

  def complete 
    @item = Item.find(params[:item_id])
    @item.sold = true
    if @item.save
      p @item
    end
  end

  def cancel 

  end
end
