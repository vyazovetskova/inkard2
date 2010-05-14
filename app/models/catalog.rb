class Catalog < ActiveRecord::Base
  has_one :description
  validates_presence_of :art, :name
  validates_length_of :art, :within => 1..10, :message =>"Данные введены неверно!"
  validates_length_of :name, :within => 1..50, :message =>"Данные введены неверно!"
end
