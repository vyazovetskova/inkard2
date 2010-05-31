class Description < ActiveRecord::Base
  belongs_to :catalog
  has_many :part_ready
  has_many :ready
  validates_presence_of :dlina, :color, :shin, :cost, :message =>"Поле не может быть пустым!"
  validates_length_of :color, :within => 1..15, :message =>"Данные введены неверно!"



  validates_numericality_of :dlina, :message =>"Поле должно быть числовым!"
  validates_format_of :dlina, :with =>/\d{1}\.[\d{2}]/, :message =>"Поле должно быть числовым!" #тут какая-то ерунда!!!!
  #validates_format_of :cost, :with =>/\d{7}\.[\d{2}]/, :message =>"Поле должно быть числовым!"
  validates_numericality_of :cost, :message =>"Поле должно быть числовым!"

  def validate
    if self.dlina<= 0.0
      errors.add("Данные введены не верно!")
    end
      if self.cost<= 0.0
      errors.add("Данные введены не верно!")
    end
  end

private
  
def make_art

     a=self.color
     b=self.dlina
     c=self.shin
     e=self.catalog.art
     d=e+a+b.to_s+'/'+c.to_s
    self.fulart =d


  end

 
end

