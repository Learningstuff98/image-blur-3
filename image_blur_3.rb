class Image
  def initialize(array)
    @array = array
  end

  def output_image
    @array.each do |arrays|
      puts arrays.join
    end
  end

  def find_coordinates
    coordinates = []
    @array.each_with_index do |inner_array, col|
      inner_array.each_with_index do |number, row|
        coordinates.push([row, col]) if number == 1
      end
    end
    coordinates
  end

  def distance(zero_col, zero_row, origin_col, origin_row)
    (origin_row - zero_row).abs + (origin_col - zero_col).abs
  end

  def blur(blur_distance)
    origional_coordinates = find_coordinates
    @array.each_with_index do |array, row|
      array.each_with_index do |_or_array_element, col|
        origional_coordinates.each do |origin_col, origin_row|
          if distance(col, row, origin_col, origin_row) <= blur_distance
            array[col] = 1
          end
        end
      end
    end
  end
end

image = Image.new([
                    [1, 0, 0, 0, 0, 0, 0, 0, 1],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [1, 0, 0, 0, 0, 0, 0, 0, 1]
                  ])

image.blur(3)

image.output_image
