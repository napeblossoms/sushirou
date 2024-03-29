class PostSushi < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :region, presence: true
  validates :prefecture, presence: true
  validates :municipalities, presence: true
  validates :lunch_dinner, presence: true

  enum region: {
   北海道:0,東北:1,関東:2,中部:3,近畿:4,中国:5,四国:6,九州:7
  }, _prefix: true

  enum prefecture: {
    北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
    茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
    新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
    岐阜県:20,静岡県:21,愛知県:22,三重県:23,
    滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
    鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
    徳島県:35,香川県:36,愛媛県:37,高知県:38,
    福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,沖縄県:46
  }, _prefix: true

  enum price: {
     "~￥999": 0, "￥1,000~￥2,999": 1, "￥3,000~￥4,999": 2, "￥5,000~￥9,999": 3, "￥10,000~￥14,999": 4, "￥15,000~￥19,999": 5, "￥20,000～": 6
   }, _prefix: true

  enum atmosphere: {
    "落ち着いた雰囲気":0,"気軽に入れる":1,"記念日にぴったり":2
  },_prefix: true

  enum lunch_dinner: {
    "ランチ":0,"ディナー":1
  },_prefix: true

   def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
   end

   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end


end
