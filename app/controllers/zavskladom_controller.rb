class ZavskladomController < ApplicationController
def purchases
    @allpurchases= Parts_purchase.all
  end
  def showready
    @allready= Ready.all
  end
  def deletdata


  @catalog= Part.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @catalog= Part.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
          k=1
        end
          if params[:upd][:name]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:name]}'"
          else
           condit="name= '#{params[:upd][:name]}'"
          end
        end
      end
      session[:cat]=condit
      redirect_to :action=>'destroydata'
    end
  end
  def destroydata
    condit=session[:cat]
    if condit==''
      @catalog=Part.all
    else
      @catalog=Part.find(:all, :conditions=>condit)
    end
  end
  def deletready


  @prod= Ready.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @prod= Ready.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
          k=1
        end
          if params[:upd][:name]!= '' then
            @f=Catalog.find(:first,:conditions => "name= '#{params[:upd][:name]}")
          end
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:name]}'"
          else
           condit="name= '#{params[:upd][:name]}'"
           k=1
          end
           id=@f.id

          if k==1 then
          condit= condit+' and '+"catalog_id=#{id}"
          else
          condit="catalog_id=#{id}"
          k=1
          if params[:upd][:d_no]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:d_no]}'"
          else
           condit="name= '#{params[:upd][:d_no]}'"
           k=1
          end
        end

      end
      session[:cat]=condit
      redirect_to :action=>'destroyready'
    end
  end
   def destroyready
    condit=session[:cat]
    if condit==''
      @prod=Ready.all
    else
      @prod=Ready.find(:all, :conditions=>condit)
    end
  end
end
def brakready
  
    @brak=Ready.all
       if request.post?
      if params[:update_type][:type]=='all' then
        @brak= Ready.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
          k=1
        end
          if params[:upd][:d_no]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:d_no]}'"
          else
           condit="name= '#{params[:upd][:d_no]}'"
           k=1
          end
        end
          if params[:upd][:name]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:name]}'"
          else
           condit="name= '#{params[:upd][:name]}'"
          end
        end
      end
      session[:cat]=condit
      redirect_to :action=>'destroybrakready'
    end
    def destroybrakready

    condit=session[:cat]
    if condit==''
      @brakp=Ready.all
    else
      @brakp=Ready.find(:all, :conditions=>condit)
    end
    end
  end
  
  def brakpurcase

  @brakp= Part.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @brakp= Part.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
          k=1
        end
          if params[:upd][:name]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:name]}'"
          else
           condit="name= '#{params[:upd][:name]}'"
          end
        end
      end
      session[:cat]=condit
      redirect_to :action=>'destroybrakpurcase'
    end
       def destroybrakpurcase

    condit=session[:cat]
    if condit==''
      @brakp=Part.all
    else
      @brakp=Part.find(:all, :conditions=>condit)
    end
       end
  end
  def datepurcase
      @par= Part.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @par= Part.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
          k=1
        end
          if params[:upd][:name]!= '' then
          if k==1 then
            condit= condit+' and '+"name='#{params[:upd][:name]}'"
          else
           condit="name= '#{params[:upd][:name]}'"
          end
        end
      end
      session[:cat]=condit
      redirect_to :action=>'datechangepurcase'
    end
     def datechangepurcase
         condit=session[:cat]
    if condit==''
      @par=Part.all
    else
      @par=Part.find(:all, :conditions=>condit)
    end
     end
  end
 

 
  def kolchangepurcase
     @kol= Part.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @kol= Part.all
       condit=''
      else
        if params[:upd][:art]!= '' then
          condit="art= '#{params[:upd][:art]}'"
        end

      end
      session[:cat]=condit
      redirect_to :action=>'kolchange'
    end

  def kolchange
    condit=session[:cat]
    if condit==''
      @kol=Part.all
    else
      @kol=Part.find(:all, :conditions=>condit)
  end
  end
  end
  def datareadychange
     @sost= Ready.all

    if request.post?
      if params[:update_type][:type]=='all' then
        @sost= Ready.all
       condit=''
      else
        if params[:upd][:d_no]!= '' then
          condit="art= '#{params[:upd][:d_no]}'"
        end

      end
      session[:cat]=condit
      redirect_to :action=>'changedataready'
    end
    def changedataready
    condit=session[:cat]
    if condit==''
      @sost=Ready.all
    else
      @sost=Ready.find(:all, :conditions=>condit)
  end
  end
  end
  end


  
  
