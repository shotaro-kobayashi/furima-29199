class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence:true do
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' },allow_nil: true
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' },allow_nil: true
    validates :first_furi,format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"},allow_nil: true
    validates :last_furi,format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。" },allow_nil: true
    validates :nickname
    validates :date
    validates :email
    validates :password
  end  
end
