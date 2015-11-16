class Sign < ActiveRecord::Base
	has_attached_file :image_1, styles: { medium: "300x300>", thumb: "175x175>" }, 
    :default_url => "http://www.cabanasdechile.com/res/img/common/missing-thumbnail.jpg",
    :storage => :s3,
    :bucket => 'astro-logical-assets'
    validates_attachment_content_type :image_1, :content_type => /\Aimage\/.*\Z/
end
   	#validates_presence_of :slug
	# def to_param
	# 	slug
	# end

