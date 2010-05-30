
# To change this template, choose Tools | Templates
# and open the template in the editor.

class Client < ActiveRecord::Base
  validates_presence_of :cl_org, :cl_fio, :cl_adrur, :cl_adrfiz , :cl_inn, :cl_kpp, :cl_rs, :cl_bik, :cl_tel, :cl_bank, :cl_ks, :message =>"Поле не может быть пустым!"
  validates_uniqueness_of :cl_inn, :cl_kpp, :cl_bik, :cl_ks
#тут добавляйте ограничения
  has_many :order
end
