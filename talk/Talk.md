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

* Feedback and Questions STL Elixir Talk 2017-21-03

  Where does this pattern not work or not make sense?
  Very good question, I would like to push the boundaries and try this pattern
  in a lot of types of applications looking for times when it just does not make
  sense. Then document the cases when this pattern is not a good choice.

  CQRS Related? Yes there are some similarities and I have only seen some talks about
  that pattern but never used it. I want to learn more about it so I can document
  where it is different and where that pattern may make more sense than this one.

  Handling errors when using cast, tell and forget types of calls in the app.
  Currently I am not handling anything like this in the demo app. I don't like it
  when people demo stuff and are like, "Don't do this in production" and I am
  totally doing that now. It does not teach others what to do in production.
  I want to update this to properly handle errors and such to teach.

  Validation Layer? There could be a validation layer.
  It is just like piping through another function really.
  But adding a V. to H.A.Q.T. does not sound as cool, lol.
  As with anything if you have a need for a full layer of
  validations then go ahead and add them into the flow.

  Handler with something like form data from UI.
  This should demonstrate picking out values needed for actions
  from the incoming data in the handler file.

  Railties pattern for errors. Need to research this more to fully
  understand the pattern, Craig gave a high level explanation but
  will need to see some code to solidify the idea and see how it applies here.

  Handling DB validation errors in query.
  We should demonstrate when you are using a DB and you get and error from the DB call
  like a constraint violation. How do we handle that and does it bubble up?

  The Erik Meijer bit was not tied in very well and did not seem to add much.
  Work on providing more info to back the layer and OSI comparison or pull the reference.
