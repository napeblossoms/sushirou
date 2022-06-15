class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_sushis, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  #いいね(タベタイ)機能
  has_many :favorites, dependent: :destroy
  #フォロー・フォロワー機能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォローした
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォローされた
  has_many :followings, through: :relationships, source: :followed #フォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower #フォローされている人

  has_one_attached :profile_image

  #フォローしたときの処理
  def follow(end_user_id)
    relationships.create(followed_id: end_user_id)
  end
  #フォローを外すときの処理
  def unfollow(end_user_id)
    relationships.find_by(followed_id: end_user_id).destroy
  end
  #フォローしているかの判定
  def following?(end_user)
    followings.include?(end_user)
  end


  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end

  def self.guest #ゲスト
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = "guestuser"
    end
  end

end
