class NachprController < ApplicationController

 def neworder
   @newready=Ready.find(:all,:conditions=>"sost=1")
  
   
 end

 def noworder
   @sost=[]
   @newready=Ready.find(:all,:conditions=>"sost!=1")
   for i in @newready
     k=i.id
     if i.sost==2
       @sost[k]='готово'
     else
       @sost[k]='возврат'
     end
   end
 end

 def newreq #новая заявка на комплектующие
   
   @req = PartsPurchase.new(params[:parts_purchase])

                if request.post? then
                  if @req.save then
                    if @req.valid? then
                        redirect_to :controller => :nachpr, :action => :nachpr
                    else
                        logger.debug "invalid description"
                    end
                  else
                  end
                end
 end

 def gpstatus
   if request.post? then
     session[:id]=params[:update_type][:type]
     id=session[:id]
      @r=Ready.find(id)
      @r.sost=2
     
      redirect_to :controller => :nachpr, :action => :nachpr
   end
   @r
 end

end
