# Long Hoang, ImageBlur2

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




  def blur

    # find locations of 1's
    # save location into a list
    # go to the corresponding locations to change values to 1


    # obtain locations of 1's
    one_locations = Array.new

    img_array.length.times do |vertical_index|
      
      img_array[vertical_index].length.times do |horizontal_index|
        if img_array[vertical_index][horizontal_index] == 1 
          one_locations << [vertical_index,horizontal_index]
        end
      end 

    end


    # create locations array to make changes

    list_for_change = Array.new

    one_locations.each do |spot|


      vert_original = spot[0]
      horiz_original = spot[1]

      # up
      list_for_change << [vert_original-1,horiz_original]

      # down
      list_for_change << [vert_original+1,horiz_original]  
      
      # left 
      list_for_change << [vert_original,horiz_original-1]  

      # right 
      list_for_change << [vert_original,horiz_original+1]  



    end 

   


    # remove any non- existent locations outside the pic 


    list_for_change.delete_if {|loc_a| loc_a[0] < 0 || loc_a[1] < 0 || loc_a[0] > img_array.length-1 || loc_a[1] > img_array[0].length-1}




    # remove any locations that already have a 1 in that space

    list_for_change.each do |loc_b|
      if one_locations.include?(loc_b) == true
        list_for_change.delete(loc_b)
      end
    end




    # make changes to the image array
    puts
    print "Blurred Image: "
    puts

    list_for_change.each do |loc|
    img_array[loc[0]][loc[1]] = 1
    end

    self.output_image

  end



end

test_img = Image.new([
  [1, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 1]

])
test_img.output_image
test_img.blur
