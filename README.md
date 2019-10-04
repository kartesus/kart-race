## Kart

The program reads a log of  a kart race events and outputs conclusions about the final state of the race.

The repository includes the sample log given in the description in `sample.txt`. To run the program simply

```
$ ./bin/kart sample.txt
```

## Solution

Since the challenge didn't specified any preferencial output format, the program just pretty prints
the final state of the race.

### Immutability

A good way to achieve immutability in a language without native persistent data structures is to use
immutable events as the primary way to convey state change. That's the route I took with this challenge.

Services do have some mutable state, but that state is not shared.

### DDD

The challenge description suggests a separation of responsability based on DDD. I have used DDD terms
wherever it felt appropriate, e.g. repositories for connection with external data sources. Other things,
like aggregates, aren't as meaningful in this context given the ephemeral nature of state 
in the application.

DDD have a strong emphasis in interaction with domain experts and modeling based on the organization
own separation of responsabilities. For example, computing the best lap for a driver and the best lap
for the race, could be the responsability of the _best lap team_ or could be split between the _driver_
and _race_ teams. I refrained from making assumptions about it and focused the architecture in more
practical preferences.

Every individual service reflects one conclusion about the state of the race and there is one special
service (`Kart::Services::Scoring`) which is responsible for aggregating those conclusions and
compute the final state of the race. The services follow an Open/Close philosophy, where new services
can be developed in parallel and deployed incrementally without affecting other services.

### Testing

I mismanaged my time and tests suffered from it. The few coverage that I have was crutial though during
the maturation of the architecture, allowing me to make big changes safelly. Once the architecture was
fixed and the time was short I chose the technical debt of improving test coverage on services
in the future and focused on implementing the services. This debt is attenuated because the architecture
is optmized to be testable and it's really just a matter of time and effort.