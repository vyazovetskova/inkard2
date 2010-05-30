# To change this template, choose Tools | Templates
# and open the template in the editor.

class PartsProvider < ActiveRecord::Base
  #cost>0
  belongs_to :provider
  validates_presence_of :cost, :message =>"Поле не может быть пустым!"
  #def validate
   # if self.cost<= 0.0
    #  errors.add( "Данные введены не верно!")
    #end
  #end
end
