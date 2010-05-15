# To change this template, choose Tools | Templates
# and open the template in the editor.

class ManagerController < ApplicationController
 layout "manager"

  def index
    
  end
  ############
  def view_outstanding_orders
    @OutstOrders=Order.all
  end

  def view_complited_orders
    @CompliteOrders=Order.all
  end

  def view_ready_orders
    @ReadyOrders=Order.all
  end

  def view_current_orders
    @CurOrders=Order.all
  end

   ###########
  def clients
    @allclients= Client.all
  end

  #############
  def view_redies
    @redies=Ready.all
  end

  ############
  #def orders

  #end

  ##############
  #def parts_providers

  #end

  ##############
  #def parts_purchases

  #end

  ###############
  #def providers

  #end

  #############
  #def purchases

  #end

  #############
  #def redys

  #end
  
end
