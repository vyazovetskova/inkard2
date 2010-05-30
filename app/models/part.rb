class Part < ActiveRecord::Base
    validates_presence_of :art, :name, :kol =>"Поле не может быть пустым!"
    validates_numericality_of :rezerv, :kol, :brak =>"Поле должно быть числовым!"
end
