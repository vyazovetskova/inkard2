# To change this template, choose Tools | Templates
# and open the template in the editor.

class Description < ActiveRecord::Base
  #cost>0
  belongs_to :catalog
  has_many :ready

  validates_presence_of :dlina, :color, :shin, :cost, :fulart
  validates_length_of :color, :within => 1..15, :message =>"Данные введены неверно!"
  def validate
    if Description.dlina<= 0.0
      errors.add ( "Данные введены не верно!")
    end
      if Description.cost<= 0.0
      errors.add ( "Данные введены не верно!")
    end
  end
end
