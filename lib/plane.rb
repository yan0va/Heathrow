class Plane

	attr_reader :name

	def initialize(name)
		@name = name
		@flying = true
	end

	# def name
	# 	@name
	# end

	def flying?
		@flying
	end

	def land
		raise "You have already landed, moron!" if !@flying
		@flying = false
	end

	def take_off
		raise "You are already flying! You must be a great pilot!" if @flying
		@flying = true
	end

end

