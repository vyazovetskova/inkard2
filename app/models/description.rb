class Description < ActiveRecord::Base
  belongs_to :catalog
  validates_presence_of :dlina, :color, :shin, :cost, :fulart
  validates_length_of :color, :within => 1..15, :message =>"Данные введены неверно!"
  def validate
    if self.dlina<= 0.0
      errors.add ( "Данные введены не верно!")
    end
      if self.cost<= 0.0
      errors.add ( "Данные введены не верно!")
    end
  end
end

