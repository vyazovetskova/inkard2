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

#      if params[:upd][:name]!='' then
        @conditions=condit
        @catalog= Description.find(:all,:conditions => condit )

       
      end
    end
  end

def infoorder
  
end

def catalogdel
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

#      if params[:upd][:name]!='' then
        @conditions=condit
        @catalog= Description.find(:all,:conditions => condit )
       session[:catalog]=@catalog

      end
    end
  end
        




def destroy
  session[:catalog].each{|cat|
    if params[:catdel][:u]==1 then
      @delit = Catalog.find(@catalog.id)
      @delit2= Description.find(:conditions => {:caralog_id => @catalog.id })
      @delit.destroy
      @delit2.destroy

    end
    }

end

def ok
end

end
