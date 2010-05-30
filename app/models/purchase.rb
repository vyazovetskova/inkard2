class Purchase < ActiveRecord::Base #закупки
  #тут добавляйте ограничения
  belongs_to :provider

  has_many :partspurchase
  validates_presence_of :asum, :datadone, :message =>"Поле не может быть пустым!"
  validates_numericality_of :asum, :message =>"Поле должно быть числовым!"
  
  def validate
    if Purchase.asum <= 0.0
      errors.add( "Данные введены не верно!")
    end
  end

end
