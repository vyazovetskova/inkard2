class Description < ActiveRecord::Base
  belongs_to :catalog

  validates_presence_of :dlina, :color, :shin, :cost, :message =>"Поле не может быть пустым!"
  validates_length_of :color, :within => 1..15, :message =>"Данные введены неверно!"


validates_numericality_of :dlina, :message =>"Поле должно быть числовым!"
  validates_format_of :dlina, :with =>/\d{1}\.[\d{2}]/, :message =>"Поле должно быть числовым!" #тут какая-то ерунда!!!!
  #validates_format_of :cost, :with =>/\d{7}\.[\d{2}]/, :message =>"Поле должно быть числовым!"
  validates_numericality_of :cost, :message =>"Поле должно быть числовым!"
  #validates_size_of :cost, :maximum => 9999, :message =>"Введенная цена не укладывается в диапазон от 0 до 100 тыс.руб"

 before_validation  :make_art
  
# def validate
#   errors.add(:dlina,"Данные введены не верно!") if dlina.nil? || dlina<=0
#   errors.add(:cost, "Данные введены неверно!") if cost.nil? || cost<=0
# end


private
  
def make_art

     a=self.color
     b=self.dlina
     c=self.shin
     e=self.catalog.art
     d=e+a+b.to_s+'/'+c.to_s
    self.fulart =d

  end
#
#def checkit
#  if self.cost <= 0 || self.cost > 99999
#    errors.add(:cost, "Something's wrong!")
#  end
#end
 
end

