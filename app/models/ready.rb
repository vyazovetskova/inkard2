# To change this template, choose Tools | Templates
# and open the template in the editor.

class Ready < ActiveRecord::Base
  #
  #sost in (1,2,3)
  belongs_to :order
  belongs_to :description

  before_validation :make_default
  
  def validate
    if self.sost!=1 || self.sost!=2 || self.sost!=3
      errors.add( "Данные введены не верно!")
    end

    if self.brak<0
      errors.add( "Данные введены не верно!")
    end

    if self.kol<=0
      errors.add( "Данные введены не верно!")
    end
  end

  private
    def make_default
      self.brak=0
      self.sost=1
    end
end
