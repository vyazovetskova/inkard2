# To change this template, choose Tools | Templates
# and open the template in the editor.

class Order < ActiveRecord::Base
  #Мои ограничения!!!
  #asum>0
  #datastop>datago
  belongs_to :client
  has_many :ready

  def validate
    if self.asum <= 0.0
      errors.add( "Данные введены не верно!")
    end
    if self.datastop<=self.datago
      errors.add( "Данные введены не верно!")
    end
  end
end
