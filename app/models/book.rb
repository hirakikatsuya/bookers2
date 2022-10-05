class Book < ApplicationRecord
  belongs_to:user

   has_one_attached:image

   def get_image
     if image.attached?
       image
     else
       'no_image.jpg'
     end
   end

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path=Rails.root.join('app/assetsimages/no_image.jpg')
      profile_image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width,height]).processed
  end
end