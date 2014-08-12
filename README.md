#Heathrow


##Makers Academy Week 3 Test


###Aim

The aim of this test was to write software to control the flow of planes at an airport.

We had to create separate files for every class, module and test suite.


Features

* Planes can land and take off, given the weather is sunny
* The weather is controlled by a random number generator, and is ocasionally stormy
* Every plane must have a status indicating whether it is flying or landed
* Once all the planes are in the air, check that they have the status of flying!
* Check when all the planes have landed that they have the right status "landed"
* Add messages to explain what is going on, e.g "Sorry! You can't take off due to stormy weather"


###Other details

The test was set by Evgeny Shadchnev [@shadchnev](https://github.com/shadchnev)

## FEEDBACK

Consider the following
```
def park(plane)
  raise "Sorry! You can't land due to stormy weather" if weather_stormy?
  raise "Sorry! Airport is full!" if full?
  @planes << plane
  plane.land
end
```

What would happen if the plane failed to land.
Also if two system where running at once could someone instruct a plane before it had landed?

It's 25% stormy weather!!

If you don't really need a name for the plane give it a default, notice how your tests have become poluted with this information e.g Plane.new("xxx")

How would you go about having the weather as a collaborator class rather than a module? Try refactoring the code to something like.

```
weather = Weather.new
airport = Airport.new(weather)
```

 # PASS
