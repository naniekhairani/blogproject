class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  has_many :comments 
  has_many :photo
  has_many :login
  before_destroy :delete_image_directory
  
  #Method to delete a directory
   def rmtree(directory)
   Dir.foreach(directory) do |entry|
     next if entry =~ /^\.\.?$/     # Ignore . and .. as usual
     path = directory + "/" + entry
     if FileTest.directory?(path)
       rmtree(path)
     else
       File.delete(path)
     end
   end
   Dir.delete(directory)
 end
  
   def delete_image_directory
   image_dir = "#{RAILS_ROOT}/public/images/products/#{self.id}"
   if File.exist?(image_dir)
     begin
       rmtree(image_dir)
     rescue
     end
   end
   end
  
end
