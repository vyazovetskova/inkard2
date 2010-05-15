# To change this template, choose Tools | Templates
# and open the template in the editor.

class Purchase < ActiveRecord::Base #закупки
  #asum>0
  belongs_to :provider
  has_many :partspurchase

  def validate
    if Purchase.asum <= 0.0
      errors.add ( "Данные введены не верно!")
    end
  end
end
