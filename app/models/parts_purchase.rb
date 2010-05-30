# To change this template, choose Tools | Templates
# and open the template in the editor.

class PartsPurchase < ActiveRecord::Base
  #kol>0
  belongs_to :purchase
  validates_presence_of :kol, :message =>"Поле не может быть пустым!"
  def validate
    if PartsPurchase.kol <= 0
      errors.add( "Данные введены не верно!")
    end
  end
end
