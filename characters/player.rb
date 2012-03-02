require_relative  'character'

class Player < Character
	attr_accessor :x,:y
	def initialize(director,x = 250, y = 568, image_file = nil)
   	   @director = director
   	   @x, @y = x, y
   	   @speed = 2
	   @image = char_image(image_file)
	   @collision = CollisionBox.new(self, 0, 0,@image.width, @image.height)
	   @sflag = false
	   @count = 0
	   super
        end
	def move
		if @sflag == true
			@count += 1
			if @count == 3*60
				@speed = 2
				@count = 0
				@sflag = false
			end
		
		end
		@x += Input.x * @speed
		#�E��ʒ[�Ƃт����Ă���߂�
		if @x > 500 - @image.width
			@x = 500 - @image.width
		#���ɂƂтłĂ���߂�
		elsif @x < 0
			@x = 0
		end
		reset_collision_pos
	end
	# �ǉ�
	def change
	   @image = Image.load("images/player2.png")
	end

	# �ǉ�
	def rechage
	  @image = Image.load("images/player.png")
	end

	def hit(obj)
    	puts "Hit to #{obj} by Player"
  	end

	def char_image(image_file = nil)
    	image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player.png")
    	img = Image.load(image_file)
    	img.setColorKey([255, 255, 255])
    return img
  end

	def speed_down(atai)
		@speed -= atai
		#�X�s�[�h�����ĂP�ȉ���������P�ɂ��ǂ�
		if @speed < 1
			@speed = 1
		end
		@sflag = true
 	end
end