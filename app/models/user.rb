class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  # ↓フォロー関係記述
  # 自分が、フォローしているユーザー関連
  # 自分がフォローされているユーザー関連
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id"
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followeds, through: :passive_relationships, source: :following
  
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  # このメソッドでは、passiveなので、フォローされている方が、foreign_idになる。＝＞フォローしてくれてる人かどうかをチェック！
  
  # ↓　住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name  #都道府県コードから、都道府県名に自動で変換する。
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)　#　@user.prefecture_nameで、そのuserの住所が取得できるようになる。
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  # ↑　住所自動入力
  
  
  
  attachment :profile_image

  validates :name, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }

  validates :introduction, length: { maximum: 50 }
  validates :postcode, length: {minimum: 7, maximum: 7}
end
