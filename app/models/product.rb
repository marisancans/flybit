class Product < ActiveRecord::Base
	belongs_to :department, dependent: :destroy

	has_attached_file :image,
	    :storage => :dropbox,
	    :dropbox_credentials => { app_key: ENV['APP_KEY'],
	                              app_secret: ENV['APP_SECRET'],
	                              access_token: ENV['ACCESS_TOKEN'],
	                              access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
	                              user_id: ENV['USER_ID'],
	                              access_type: 'app_folder'}
	validates :image, attachment_presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	 #has_many :department
end

