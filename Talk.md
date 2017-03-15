HAQT Pattern

* What

  Not another framework
    exists outside of your http or database
  Layered design
  A way to think about how things should be isolated naturally
  Each module is a subsystem with the pattern
  Each subsystem should be abstract-able into its own app/worker/??

* Where

  High Performance Computing project
  Event Sourcing/Driven system

* Who

  @juanpaco Ethan Garofolo
  @tapickell Todd Pickell

* When

  You want decoupled systems
  You want to be able to easily change inputs and outputs
  You want to easily test and reason about what the modules do
  You want adding new things to the system to be trivial
  You want a system that is flexible without changing the domain logic

* Why

  * For my Team

    Ever changing requirements, environments and tools
    Isolating legacy part of system that was still required

  * For anyone

    Separates concerns
    Cleans up code base
    Puts modules files together
    Is outside of any framework
