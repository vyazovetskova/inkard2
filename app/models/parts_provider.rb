# To change this template, choose Tools | Templates
# and open the template in the editor.

class PartsProvider < ActiveRecord::Base
  #cost>0
  belongs_to :provider
  def validate
    if PartsProvider.cost <= 0.0
      errors.add( "Данные введены не верно!")
    end
  end
end
