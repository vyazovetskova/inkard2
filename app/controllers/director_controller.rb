class DirectorController < ApplicationController
  layout 'director'
  def director
  end

def newcatalog
  @catalog = Catalog.new(params[:catalog])
  @description = Description.new(params[:description])

  #@description= Catalog.Description.new
  if request.post?
   # params[:description][:cost].gsub!(/,/, '.')


  if @catalog.save

      @catalog.description = @description #:dlina => "sldfkjdskfj", :color => "sdfdsfds", :shin => 1, :cost=>1500, :fulart => d)


         if @description.valid?#params[:description][:dlina].gsub!(/,/, '.')
        #TODO: Поменять редирект на главную страницу, когда она будет
        redirect_to :controller => :director, :action => :ok
      else
        logger.debug "invalid description"
        #render :action => :newcatalog
      end
    else
      #render :action => :newcatalog
    end
  end
end

def cataloglook
  @allcatalog= Catalog.all
end

def catalogupdate

@catalog= Description.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @catalog= Description.all


      else
        if params[:upd][:dlinamin]!= '' then
          condit="dlina>= '#{params[:upd][:dlinamin]}'"
          k=1
          if params[:upd][:dlinamax]!= '' then
            condit="dlina>= '#{params[:upd][:dlinamin]}' and dlina<= '#{params[:upd][:dlinamax]}'"
          end

        else
          if params[:upd][:dlinamax]!= '' then
          condit="dlina<= '#{params[:upd][:dlinamax]}'"
          k=1

          end
        end


      if params[:upd][:costmin]!= '' then
          if k==1 then
          condit=condit+' and '+"cost>= '#{params[:upd][:costmin]}'"
          else
            condit="cost>= '#{params[:upd][:costmin]}'"
          k=1
          end
          if params[:upd][:costmax]!= '' then

            condit=condit+" and cost<= '#{params[:upd][:costmax]}'"
            k=1
          end

        else
          if params[:upd][:costmax]!= '' then
          if k==1 then
          condit=condit+' and '+"cost<= '#{params[:upd][:costmax]}'"
          else
           condit="cost<= '#{params[:upd][:costmax]}'"
          k=1
          end
          end
        end


      if params[:upd][:color]!='' then #проверка цвета

        if k==1 then
          condit= condit+' and '+"color= '#{params[:upd][:color]}'"
        else
          condit="color= '#{params[:upd][:color]}'"
          k=1
        end
      end

      if params[:upd][:name]!='' then
        if params[:upd][:art]!='' then
        #проверка наименования
          @f=Catalog.find(:all,:conditions => "name= '#{params[:upd][:name]}' and art='#{params[:upd][:art]}' ")

        else
          @f=Catalog.find(:all,:conditions => "name= '#{params[:upd][:name]}'")
          puts '#############'

        end
        
        z=0
        t=[]
        for i in @f
        t[z]=i.id
        z=z+1

        end
        if t[0]!=nil
        cond="catalog_id=#{t[0]}"
        for j in t
          cond=cond+' or '+"catalog_id=#{j}"
        end
          if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end
          puts condit
      end
      end

      if params[:upd][:name]=='' and params[:upd][:art]!='' then
        @f=Catalog.find(:all,:conditions => "art = '#{params[:upd][:art]}'")
       puts '##############'
       
        z=0
        t=[]
        for i in @f
        t[z]=i.id
        z=z+1

        end

        if t[0]!=nil
        cond="catalog_id=#{t[0]}"
        for j in t
          cond=cond+' or '+"catalog_id=#{j}"
        end
          if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end
          puts condit
        if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end
        end
      end

      if params[:update_type][:shin]!='all' then #проверка шины
        if k==1 then
          if params[:update_type][:shin]=='yes' then
          condit= condit+' and '+"shin=1"
          else
          condit= condit+' and '+"shin='0'"
          end
        else

          k=1
          if params[:update_type][:shin]=='yes' then
          condit="shin=1"
          else

          condit="shin='0'"
          end
        end
      end


# if params[:upd][:name]!='' then
        @conditions=condit
        @catalog= Description.find(:all,:conditions => condit )


      end
      session[:cat]=condit
  redirect_to :action=>:update
    end
  end

def update
  condit=session[:cat]
  @catalog= Description.find(:all,:conditions => condit )
  if request.post?
    session[:id]=params[:update_type][:type]
    redirect_to :action=>:update_one
  end
end
def update_one
  id=session[:id]
  @one=Description.find(id)
  @catone=Catalog.find(@one.catalog_id)
  @catalog=Catalog.new(params[:catalog])
  @desc=Description.new(params[:description])
  puts @desc
  puts '#############################'
  if request.post?
    @catalog.id=@catone.id
    @desc.id=@one.id
    @desc.catalog_id=@catalog.id
    if @catalog.name==''
      @catalog.name=@catone.name
     
    end
    if @catalog.art==''
      @catalog.art=@catone.art
    end
    if @desc.dlina==nil
      @desc.dlina=@one.dlina
    end
    if @desc.cost==nil
      @desc.cost=@one.cost
    end
    if @desc.color==''
      @desc.color=@one.color
    end
    if @desc.valid?
      if @catalog.valid?
    @one.destroy
    @desc.save
    
    @catone.destroy
    @catalog.save
    

    redirect_to :action=>'ok'
    end
    end
  end

end

def infoorder
  @sostzak=[]
  @allorder=Order.all
  for ord in @allorder
    k=ord.id #считали id
    @sostzak[k]='готов'
    @r=Ready.find(:all,:conditions=> "order_id= '#{k}'") #нашли гп  заказа
    for i in @r
      if i.sost!=2 then
       @sostzak[k]='не готов'
      end
    end

  end

end

def catalogdel
 
  k=0
  @catalog= Description.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @catalog= Description.all
      else
        if params[:upd][:name]!='' then
        if params[:upd][:art]!='' then
        #проверка наименования
          @f=Catalog.find(:all,:conditions => "name= '#{params[:upd][:name]}' and art='#{params[:upd][:art]}' ")

        else
          @f=Catalog.find(:all,:conditions => "name= '#{params[:upd][:name]}'")
          puts '#############'
          
        end
        
        z=0
        t=[]
        for i in @f
        t[z]=i.id
        z=z+1

        end
        if t[0]!=nil
        cond="catalog_id=#{t[0]}"
        for j in t
          cond=cond+' or '+"catalog_id=#{j}"
        end
          if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end
          puts condit
      end
        end
      if params[:upd][:name]=='' and params[:upd][:art]!='' then
        @f=Catalog.find(:all,:conditions => "art = '#{params[:upd][:art]}'")
        
        z=0
        t=[]
        for i in @f
        t[z]=i.id
        z=z+1

        end
        if t[0]!=nil
        cond="catalog_id=#{t[0]}"
        for j in t
          cond=cond+' or '+"catalog_id=#{j}"
        end
          if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end
          puts condit
        if k==1 then
          condit= condit+' and '+cond
          else
          condit=cond
          k=1
          end

      end
      end
        if params[:upd][:dlinamin]!= '' then

          condit="dlina>= '#{params[:upd][:dlinamin]}'"
          k=1
          if params[:upd][:dlinamax]!= '' then
            condit="dlina>= '#{params[:upd][:dlinamin]}' and dlina<= '#{params[:upd][:dlinamax]}'"
          end

        else
          if params[:upd][:dlinamax]!= '' then
          condit="dlina<= '#{params[:upd][:dlinamax]}'"
          k=1

          end
        end


      if params[:upd][:costmin]!= '' then
          if k==1 then
          condit=condit+' and '+"cost>= '#{params[:upd][:costmin]}'"
          else
            condit="cost>= '#{params[:upd][:costmin]}'"
          k=1
          end
          if params[:upd][:costmax]!= '' then

            condit=condit+" and cost<= '#{params[:upd][:costmax]}'"
            k=1
          end

        else
          if params[:upd][:costmax]!= '' then
          if k==1 then
          condit=condit+' and '+"cost<= '#{params[:upd][:costmax]}'"
          else
           condit="cost<= '#{params[:upd][:costmax]}'"
          k=1
          end
          end
        end

      if params[:upd][:color]!='' then  #проверка цвета

        if k==1 then
          condit= condit+' and '+"color= '#{params[:upd][:color]}'"
        else
          condit="color= '#{params[:upd][:color]}'"
          k=1
        end
      end

      if params[:update_type][:shin]!='all' then  #проверка шины

        if k==1 then
          if params[:update_type][:shin]=='yes' then
          condit= condit+' and '+"shin=1"
          else
          condit= condit+' and '+"shin='0'"
          end
        else

          k=1
          if params[:update_type][:shin]=='yes' then
          condit="shin=1"
          else
          condit="shin='0'"
          end
        end
      end


# if params[:upd][:name]!='' then
        @conditions=condit
        
        
    end
    session[:cat]=condit
  redirect_to :action=>:destroy
    end
   
  end

def destroy
  condit=session[:cat]
  @catalog= Description.find(:all,:conditions => condit )
  # @catalog=session[:catalog]
 if request.post?
   @k=params[:del].keys
   @v=params[:del].values
   for i in 0..@k.length-1
     if @v[i] == "1"
        id = @k[i].to_i
        @delit = Description.find(id)
        id2=@delit.catalog_id
        @delit2= Catalog.find(id2)
      @delit.destroy
      @delit2.destroy
      
      
   end
  
 end
redirect_to :controller => :director, :action => :ok
end
end





def ok
end



end
