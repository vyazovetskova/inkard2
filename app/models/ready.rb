# To change this template, choose Tools | Templates
# and open the template in the editor.

class Ready < ActiveRecord::Base
  #
  #sost in (1,2,3)
  belongs_to :order
  belongs_to :description
  
  def validate
    if Ready.sost!=1 || Ready.sost!=2 || Ready.sost!=3
      errors.add ( "Данные введены не верно!")
    end

    if Ready.brak<0
      errors.add ( "Данные введены не верно!")
    end

    if Ready.kol<=0
      errors.add ( "Данные введены не верно!")
    end
  end
end
