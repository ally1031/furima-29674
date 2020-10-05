class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :donation
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  
  with_options presence: true do
    validates :password, format:{ with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
    validates :family_name, format: { with:/\A[ア-ンあ-んー-龥]+\z/}
    validates :first_name, format: { with:/\A[ア-ンあ-んー-龥]+\z/}
    validates :family_name_kana, format: { with:/\A(?=.*?[ァ-ン])[ァ-ン]+\z/}
    validates :first_name_kana, format: { with:/\A(?=.*?[ァ-ン])[ァ-ン]+\z/}
    validates :email, uniqueness: true 
  end

end
