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

end
