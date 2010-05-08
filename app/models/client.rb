class Client < ActiveRecord::Base
  validates_presence_of :cl_org, :cl_fio, :cl_adrur, :cl_inn, :cl_kpp, :cl_rs, :cl_bik, :cl_tel, :cl_bank, :cl_ks
  validates_uniqueness_of :cl_inn, :cl_kpp, :cl_bik, :cl_ks
#тут добавляйте ограничения
  has_many :order
end
