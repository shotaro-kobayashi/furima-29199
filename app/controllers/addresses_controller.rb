class AddressesController < ApplicationController
  def create

  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :city, :state_id,:house_number,:telephone,:house_name)#.merge(user_id: current_user.id)
  end
end
