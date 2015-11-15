class Sign < ActiveRecord::Base
	has_attached_file :image_1, styles: { medium: "442x298>", thumb: "175x175>" }, 
    :default_url => "http://www.cabanasdechile.com/res/img/common/missing-thumbnail.jpg"
    validates_attachment_content_type :image_1, content_type: /\Aimage\/.*\Z/
   	validates_presence_of :slug
	def to_param
		slug
	end
end
