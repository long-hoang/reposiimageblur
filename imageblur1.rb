# Long Hoang, ImageBlur1

class Image
  attr_accessor :img_array


  def initialize(img_array)
    self.img_array = img_array
  end

  def output_image
    self.img_array.each do |row|
     
      #prints entire row in proper format
      row.each do |single|
        print single 
      end
      puts  # nextline for next row
    end 


  end

end

test_img = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
test_img.output_image
