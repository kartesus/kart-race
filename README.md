## Kart

The program reads race information from a log file and output race statistics, also to a file.
The input is in tabular format, separeted by whitespace. The stats will be written in a structured
format, either JSON or YAML are available.

## How does it works

The program works as a event processing engine. Each service is stateful and responsible for emitting
events representing state changes. At the end of the pipeline a service aggregates the results and
computes the final state of the race. That is then given as output of the program.

For sake of simplicity, I'm using an array to represent the stream of events but one can imagine that
with little changes in the structure of the program it could be made to work with actual streams.

Here are the events:

```ruby
LapCompleted = Struct.new(:t, :id, :name, :lap, :time, :speed)
NewDriverIdentified = Struct.new(:t, :id, :name)
BestLapAchieved = Struct.new(:t, :id, :lap, :time)
AverageSpeedUpdated = Struct.new(:t, :id, :speed)
RankingPositionsChanged = Struct.new(:t, :ranking)
RaceFinished = Struct.new(:t, :time)
DriverFinished = Struct.new(:t, :time_after_race_finished)
```

## Running tests

Make sure you have the minitest gem installed `gem install minitest`.

```
ruby test/kart.rb
```