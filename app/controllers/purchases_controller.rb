class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = current_user.purchases.order('created_at DESC')
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to purchases_path, notice: 'You have purchased the movie!' }
        format.js
      else
        format.html { redirect_to movie_path(@purchase.movie), notice: 'Something went wrong, please try again' }
        format.js
      end
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:movie_purchase_option_id)
  end
end
