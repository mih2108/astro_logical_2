class Sign < ActiveRecord::Base
	validates_presence_of :slug
	has_attached_file :image_1, styles: { medium: "300x300>", thumb: "100x100>" }, 
    :default_url => "http://www.cabanasdechile.com/res/img/common/missing-thumbnail.jpg"
    validates_attachment_content_type :image_1, content_type: /\Aimage\/.*\Z/
	def to_param
		slug
	end
end
