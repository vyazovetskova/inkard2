class Autorization < ActiveRecord::Base
  validates_presence_of :login, :password, :message => "Неверная комбинация логин-пароль!"
end
