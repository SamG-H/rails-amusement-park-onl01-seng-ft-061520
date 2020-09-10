class User < ActiveRecord::Base
  after_initialize :init
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def init
    self.admin ||= false
  end
  def mood
    unless self.admin
      if self.happiness > self.nausea
        return 'happy'
      else
        return 'sad'
      end
    end
  end
  
end
