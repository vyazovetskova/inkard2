
# To change this template, choose Tools | Templates
# and open the template in the editor.

class Provider < ActiveRecord::Base
  validates_presence_of :p_org, :p_fio, :p_adrur, :p_adrfiz, :p_inn, :p_kpp, :p_rs, :p_bik, :p_tel, :p_bank, :p_ks, :message =>"Поле не может быть пустым!"
  validates_uniqueness_of :p_inn, :p_kpp, :p_bik, :p_ks
#тут добавляйте ограничения
  has_many :purchase
  has_many :partspurchase

end
