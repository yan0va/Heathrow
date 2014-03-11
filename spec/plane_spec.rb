require "./lib/plane"

describe "Plane" do 

  let(:plane) { Plane.new("SweetBird") }

	context "when created" do

		it "should have a name" do
			expect(plane.name).to eq("SweetBird")
		end

		it "should be flying" do
			expect(plane).to be_flying
		end

	end

	context "landing and taking off" do

		it "should be able to land" do
			plane.land
			expect(plane).not_to be_flying
		end

		it "should be able to take off" do
			plane.land
			expect(plane).not_to be_flying
			plane.take_off
			expect(plane).to be_flying
		end

		it "should not be able to land if it's not flying" do
			plane.land
			expect(plane).not_to be_flying
			expect{plane.land}.to raise_error(RuntimeError)
		end

		it "should not be able to take off if it's already flying" do
			expect{ plane.take_off }.to raise_error(RuntimeError)
		end

	end

end