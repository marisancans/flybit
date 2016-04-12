class Product < ActiveRecord::Base
	belongs_to :category, dependent: :destroy, counter_cache: true
	has_one :department, through: :category
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	#accept_nested_attributes_for :status_histories, reject_if: :all_blank
	#===Validation needed!===

	has_attached_file :image,
										:styles  => { :thumb => "200x200!" },
										:convert_options => {:'x200' => " -background white -gravity center -extent x200"},
	    							:storage => :dropbox,
								    :dropbox_credentials => { app_key: ENV['DROPBOX_APP_KEY'],
								                              app_secret: ENV['DROPBOX_APP_SECRET'],
								                              access_token: ENV['DROPBOX_ACCESS_TOKEN'],
								                              access_token_secret: ENV['DROPBOX_ACCESS_TOKEN_SECRET'],
								                              user_id: ENV['DROPBOX_USER_ID'],
								                              access_type: 'app_folder'}
	#validates :image, attachment_presence: true
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	 #has_many :department



	 private
 		#ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
		 	if line_items.empty?
		 		return true
		 	else
		 		errors.add(:base, 'Line Items present')
		 		return false
			end
		end

end

