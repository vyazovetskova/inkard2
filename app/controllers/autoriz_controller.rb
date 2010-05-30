class AutorizController < ApplicationController
  def autoriz
    @autorization= Autorization.new()

    if request.post?
      
      @user=Autorization.find(params[:autorization][:id])
#      puts '############################'
#      puts @user.id
       if @user.password==params[:autorization][:password]
         if @user.id==1 then
         redirect_to :controller=>'director', :action=>'cataloglook'
         end
         if @user.id==2 then
         redirect_to :controller=>'buhgalter', :action=>'orders'
         end
         if @user.id==3 then
         redirect_to :controller=>'nachpr', :action=>'neworder'
         end
       #!!!!!!!!!!!!!!! ТУТ ДОБАВЛЯЙТЕ СВОИ РАБОЧИЕ МЕСТА : МЕНЕДЖЕР= ID=5, ЗАВСКЛАД ID=3
         if @user.id=5 then
           redirect_to :controller=>'managerr', :action=>'index'
         end
       end

      end
    end
  end



