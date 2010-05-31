# To change this template, choose Tools | Templates
# and open the template in the editor.

class ManagerController < ApplicationController
 layout "manager"

  def index
    
  end
  

  def orders
    @orders = Ready.all
    if request.post?
      if params[:update_type][:type]=='del'
        redirect_to :controller => :manager, :action => :delorder
      else
        redirect_to :controller => :manager, :action => :updorder 
      end
    end
  end


  def delorder
    @o=Order.all
    @c=Client.all
    
    if request.post?
      @k=params[:del].keys
      @v=params[:del].values
       for i in 0..@k.length-1
         if @v[i] == "1"
            id = @k[i].to_i
            @delit = Client.find(id)
            @delit.destroy
          end
       end
      redirect_to :controller => :manager, :action => :delclient
   end
  end
  
  def updorder
    
  end

  def neworder
    @order = Order.new(params[:order])
    @ready = Ready.new(params[:ready])
    #@desc = Description.new(params[:description])
    if request.post? then
      puts '##########'
      if @order.save then
        puts 'сохранен'
        @order.ready = @ready
        @ready.save
        #redirect_to :controller => :manager, :action => :ok
        if @ready.valid? then
	  #TODO: Поменять редирект на главную страницу, когда она будет
            redirect_to :controller => :manager, :action => :ok
        else
            logger.debug "invalid description"
        end
      else
      end
    end
  end


  def clients
    #@allclients= Client.new

    if request.post? then
          if params[:update_type][:type]=='delc' then
            redirect_to :controller => :manager, :action => :delclient
          else
            redirect_to :controller => :manager, :action => :updclient 
          end
    end      
  end

  def delclient
    @allclients= Client.all
    if request.post?
      @k=params[:del].keys
      @v=params[:del].values
       for i in 0..@k.length-1
         if @v[i] == "1"
           id = @k[i].to_i
            @delit = Client.find(id)
            @delit.destroy
          end
       end
      redirect_to :controller => :manager, :action => :delclient
   end
  end
  
  def updclient
    @allclients= Client.all
    if request.post?
      session[:id]=params[:update_type][:type]
      redirect_to :action=>:update_one_client
    end
  end

  def update_one_client
    id=session[:id]
    @one=Client.find(id)
    @client=Client.new(params[:client])

    if request.post?
      @client.id=@one.id

      if @client.cl_org==''
        @client.cl_org=@one.cl_org
      end

      if @client.cl_fio==''
        @client.cl_fio=@one.cl_fio
      end

      if @client.cl_adrur==''
        @client.cl_adrur=@one.cl_adrur
      end

      if @client.cl_adrfiz==''
        @client.cl_adrfiz=@one.cl_adrfiz
      end

      if @client.cl_tel==''
        @client.cl_tel=@one.cl_tel
      end

      if @client.cl_inn==''
        @client.cl_inn=@one.cl_inn
      end

      if @client.cl_kpp==''
        @client.cl_kpp=@one.cl_kpp
      end

      if @client.cl_rs==''
        @client.cl_rs=@one.cl_rs
      end

      if @client.cl_ks==''
        @client.cl_ks=@one.cl_ks
      end

      if @client.cl_bik==''
        @client.cl_bik=@one.cl_bik
      end

      if @client.cl_bank==''
        @client.cl_bank=@one.cl_bank
      end

      if @client.valid?
        @one.destroy
        @client.save
        redirect_to :action => :updclient
      end
    end
  end

  def newclient
    @client = Client.new(params[:client])
        
        if request.post? then
          puts '#########'
          if @client.save then
            if @client.valid? then 
        #TODO: Поменять редирект на главную страницу, когда она будет
                redirect_to :controller => :manager, :action => :ok
            else
                logger.debug "invalid description"
            end
          else
          end
        end
  end 

  def providers
    if request.post? then
              if params[:update_type][:type]=='delp' then
                redirect_to :controller => :manager, :action => :delprovider
              else
                redirect_to :controller => :manager, :action => :updprovider 
              end
        end      
  end
  
  def newprovider
    @provider = Provider.new(params[:provider])
                
                if request.post? then
                  if @provider.save then
                    if @provider.valid? then 
                
                        redirect_to :controller => :manager, :action => :ok
                    else
                        logger.debug "invalid description"
                    end
                  else
                  end
                end
  end
  
  def delprovider
    @allproviders= Provider.all
    if request.post?
      @k=params[:del].keys
      @v=params[:del].values
       for i in 0..@k.length-1
         if @v[i] == "1"
           id = @k[i].to_i
            @delit = Provider.find(id)
            @delit.destroy
          end
       end
      redirect_to :controller => :manager, :action => :delprovider
   end
  end
  
  def updprovider
    @allproviders= Provider.all
    if request.post?
      session[:id]=params[:update_type][:type]
      redirect_to :action=>:update_one_provider
    end
  end

  def update_one_provider
    id=session[:id]
    @one=Provider.find(id)
    @provider=Provider.new(params[:provider])

    if request.post?
      @provider.id=@one.id

      if @provider.p_org==''
        @provider.p_org=@one.p_org
      end

      if @provider.p_fio==''
        @provider.p_fio=@one.p_fio
      end

      if @provider.p_adrur==''
        @provider.p_adrur=@one.p_adrur
      end

      if @provider.p_adrfiz==''
        @provider.p_adrfiz=@one.p_adrfiz
      end

      if @provider.p_tel==''
        @provider.p_tel=@one.p_tel
      end

      if @provider.p_inn==''
        @provider.p_inn=@one.p_inn
      end

      if @provider.p_kpp==''
        @provider.p_kpp=@one.p_kpp
      end

      if @provider.p_rs==''
        @provider.p_rs=@one.p_rs
      end

      if @provider.p_ks==''
        @provider.p_ks=@one.p_ks
      end

      if @provider.p_bik==''
        @provider.p_bik=@one.p_bik
      end

      if @provider.p_bank==''
        @provider.p_bank=@one.p_bank
      end

      if @provider.valid?
        @one.destroy
        @provider.save
        redirect_to :action => :updprovider
      end
    end
  end

  def deliveries
    if request.post? then
              if params[:update_type][:type]=='deld' then
                redirect_to :controller => :manager, :action => :deldelivery
              else
                redirect_to :controller => :manager, :action => :upddelivery
              end
        end
  end

  def newdelivery
    @PartsProvider = PartsProvider.new(params[:parts_provider])

                if request.post? then
                  if @PartsProvider.save then
                    if @PartsProvider.valid? then
                        redirect_to :controller => :manager, :action => :ok
                    else
                        logger.debug "invalid description"
                    end
                  else
                  end
                end
  end

  def deldelivery
    @alldeliveries=Provider.all
    puts  "#########"
    if request.post?
      @k=params[:deldeliv].keys
      @v=params[:deldeliv].values
       for i in 0..@k.length-1
         if @v[i] == "1"
              id = @k[i].to_i
              @delit = PartsProvider.find(id)
              id2=@delit.provider_id
              @delit2= Provider.find(id2)
              @delit.destroy
              @delit2.destroy
          end
       end
      redirect_to :controller => :manager, :action => :ok
   end
  end

  def upddelivery
    
  end

  def purchases
    if request.post? then
              if params[:update_type][:type]=='delz' then
                redirect_to :controller => :manager, :action => :delpurchase
              else
                redirect_to :controller => :manager, :action => :updpurchase
              end
        end
  end

  def newpurchase

  end

  def delpurchase
    @allpurchases=Purchase.all
  end

  def updpurchase

  end
  

  def redies
    @allredies=Ready.all
  end

  def catalogs
    @allCatalog=Catalog.all
  end

  def comeback
  end

  def ok
  end

end
