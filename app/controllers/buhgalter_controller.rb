class BuhgalterController < ApplicationController
 layout "buhgalter"





  def clients
    @allclients= Client.all
  end

  def orders
    @allclients= Client.all
  end

  def providers
    @allproviders= Provider.all
  end

  def purchases
    @allpurchases= Purchase.all
  end

end
