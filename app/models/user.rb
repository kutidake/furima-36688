class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders

         validates :nickname, presence: true
         with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
          validates :last_name
          validates :first_name
        end
         validates :first_name_f, :last_name_f,format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}
         validates :last_name, presence: true
         validates :last_name_f, presence: true
         validates :first_name, presence: true
         validates :first_name_f, presence: true
         validates :birth, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
end