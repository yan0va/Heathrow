require "./lib/weather"

class Airport

	include Weather
	
	attr_reader :name, :capacity

	def initialize (name, default_capacity = 215)
		@name     = name
		@capacity = default_capacity
		@planes   = []
	end

	def planes_count
		@planes.count
	end

	def park(plane)
		raise "Sorry! You can't land due to stormy weather" if weather_stormy?
		raise "Sorry! Airport is full!" if full?
		@planes << plane
		plane.land
	end

	def release(plane)
		raise "Sorry! You can't take off due to stormy weather" if weather_stormy?
		raise "This plane is not parked here!" if !@planes.include?(plane)
		@planes.delete(plane)
		plane.take_off
	end

	def full?
		@planes.count == capacity
	end

end
