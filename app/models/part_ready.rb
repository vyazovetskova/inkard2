class PartReady < ActiveRecord::Base
 validates_presence_of :kol, :message => "Поле не может быть пустым"
 validates_length_of :art_part, :art_ready, :within => 1..50, :message =>"Данные введены неверно!"
 
  belongs_to :part
  belongs_to :description
end
