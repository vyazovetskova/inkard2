class Purchase < ActiveRecord::Base #закупки
  #тут добавляйте ограничения
  belongs_to :provider
end
