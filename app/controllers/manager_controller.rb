# To change this template, choose Tools | Templates
# and open the template in the editor.

class ManagerController < ApplicationController
 layout "manager"

  def index
    
  end
  ############
  

  def orders
    @allorders=Order.all
  end

   ###########
  def clients
    @allclients= Client.all
  end

  #############
  def redies
    @allredies=Ready.all
  end

  ############
  def catalogs
    @allCatalog=Catalog.all
  end

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
