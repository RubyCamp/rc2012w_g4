#encoding: Shift_JIS
class OpScene
    def initialize
		@scene1 = Image.load("images/scene1.png")
		@scene2 = Image.load("images/scene2.png")
		@scene3 = Image.load("images/scene3.png")
		@scene4 = Image.load("images/scene4.png")
                @bgm = Sound.new("BGM/story.wav")
		#$select = 0
    end

    def start
        @bgm.play
	@scene_flag1 = true
	@scene_flag2 = false
	@scene_flag3 = false
	@scene_flag4 = false
    end

    def act
	if @scene_flag1 == true
	        Window.draw(0,0,@scene1)
		@font = Font.new(40)
		Window.drawFont( 190, 50, "���鉴�B", @font,:color => [0, 0, 0])
		@font = Font.new(20)
		Window.drawFont( 380, 90, "�� push enter", @font,:color => [0, 0, 0])
		if Input.keyPush?( K_RETURN)
	        	@scene_flag1 = false
			@scene_flag2 = true
			@scene_flag3 = false
			@scene_flag4 = false
		end
	elsif @scene_flag2 == true
	        Window.draw(0,0,@scene2)
		@font = Font.new(20)
		Window.drawFont( 50, 50, "�ځ��Ă���Õ�������Ă���ꂽ�񂾂��ǁE�E�E", @font,:color => [0, 0, 0])
		Window.drawFont( 380, 90, "�� push enter", @font,:color => [0, 0, 0])
		if Input.keyPush?( K_RETURN)
			@scene_flag1 = false
	        	@scene_flag2 = false
			@scene_flag3 = true
			@scene_flag4 = false
		end

	elsif @scene_flag3 == true
	        Window.draw(0,0,@scene3)
		@font = Font.new(20)
		Window.drawFont( 130, 50, "�����S�͂ŋ��ۂ��Ă����B", @font,:color => [0, 0, 0])
		Window.drawFont( 380, 90, "�� push enter", @font,:color => [0, 0, 0])
		if Input.keyPush?( K_RETURN)
			@scene_flag1 = false
			@scene_flag2 = false
	        	@scene_flag3 = false
			@scene_flag4 = true
		end

	elsif @scene_flag4 == true
	        Window.draw(0,0,@scene4)
		@font = Font.new(20)
		Window.drawFont( 50, 50, "�Õ��ɖ��͕K�v�s���ł���B\n�K�R�I�ɉ��͖����m�ۂ��Ȃ��Ƃ����Ȃ��炵���B", @font,:color => [0, 0, 0])
		Window.drawFont( 380, 90, "�� push enter", @font,:color => [0, 0, 0])
		if Input.keyPush?( K_RETURN)
			@scene_flag1 = false
			@scene_flag2 = false
	        	@scene_flag3 = false
			@scene_flag4 = false
		end
	elsif 	@scene_flag1 == false && @scene_flag2 == false && @scene_flag3 == false && @scene_flag4 == false
		@font = Font.new(20)
		Window.drawFont( 50, 270, "�������āA���Ɩ��Ƃ̐킢������������̂������E�E�E", @font,:color => [255, 255, 255])
		Window.drawFont( 380, 300, "�� push enter", @font,:color => [255, 255, 255])
		if Input.keyPush?( K_RETURN)
      
		return :howto
			#case $select
			#when 0
				#return :game
			#when 1
				#return :game2
			#when 2
				#return :game3
			#end
		end
	end
    	return false
    end
    
    def draw

	
    end

		#def select_load(select)
			#@select = select
		#end
end
