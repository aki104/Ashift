class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include RankedModel
  ranks :row_order

validates :name,uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :date_tables, dependent: :destroy
  has_many :work_contents

  def email_required?
   false
 end
 def email_changed?
   false
 end


end
