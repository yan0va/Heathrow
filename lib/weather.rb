module Weather

	SUNNY   = :sunny 
	STORMY  = :stormy 
	WEATHER = [SUNNY, SUNNY, SUNNY, STORMY]

	def weather_stormy?
		Weather.sample == STORMY
	end

end