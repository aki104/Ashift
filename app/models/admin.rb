class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
validates :admin_name,uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 def email_required?
   false
 end
 def email_changed?
   false
 end


end
