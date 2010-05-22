class Order < ActiveRecord::Base

  #тут добавляйте ограничения
  belongs_to :client
end
