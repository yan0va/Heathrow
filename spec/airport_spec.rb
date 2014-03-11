require "airport"
require "plane"

describe "Airport" do

	let(:airport) { Airport.new("Heathrow", @default_capacity = 215) }
	let(:plane)   { plane = Plane.new("Cosmic_Girl") }

	context "at initialization" do

		it "should have a name" do
			# airport = Airport.new("Heathrow")
			expect(airport.name).to eq("Heathrow")
		end

		it "should be empty" do 
		expect(airport.planes_count).to eq(0)
		end

		it "should have a default capacity" do 
			expect(airport.capacity).to eq(215)
		end

	end

	context "air traffic control" do 

		before do
			airport.stub(:weather_stormy?).and_return(false)
		end

		it "should be able to park a plane" do 
			expect(airport.planes_count).to eq(0)
			airport.park(plane)
			expect(airport.planes_count).to eq(1)
		end

		it "should be able to release a plane" do 
			expect(airport.planes_count).to eq(0)
			airport.park(plane)
			expect(airport.planes_count).to eq(1)
			airport.release(plane)
			expect(airport.planes_count).to eq(0)
		end

		it "should change the flying status of a plane after landing" do
			expect(plane).to be_flying
			airport.park(plane)
			expect(plane).not_to be_flying
		end

		it "should change the status of a plane after taking off" do
			airport.park(plane)
			expect(plane).not_to be_flying
			airport.release(plane)
			expect(plane).to be_flying
		end

		it "should know when it's full" do
			expect(airport.planes_count).to eq(0) 
			(@default_capacity).times { airport.park(Plane.new("xxx")) }
			expect(airport).to be_full
		end

		it "should not allow a plane to land if it's full" do
			expect(airport.planes_count).to eq(0) 
			(@default_capacity).times { airport.park(Plane.new("xxx")) }
			expect(airport).to be_full
			expect{airport.park(Plane.new("xxx"))}.to raise_error(RuntimeError)
		end

		it "should know how many planes there are parked" do 
			expect(airport.planes_count).to eq(0)
		end

		it "should know what planes there are parked" do
			plane.land
			expect { airport.release(plane) }.to raise_error(RuntimeError)
		end

		context "weather restrictions" do

			before do
				airport.park(plane)
				airport.stub(:weather_stormy?).and_return(true)
			end

			it "should know what the weather is like" do
				expect(airport.weather_stormy?).to be_true
			end

			it "should not allow a plane to take off if there is a storm" do 
				expect { airport.release(plane) }.to raise_error(RuntimeError)
			end

			it "should not allow a plane to land if there is a storm" do
				expect { airport.park(Plane.new("Lady_Stardust")) }.to raise_error(RuntimeError)
			end

		end

	end

end













