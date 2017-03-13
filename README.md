# HAQT Pattern implementation in Elixir

Todd Pickell <tapickell@gmail.com> @tapickell

```
 ---------      --------      -------      -----------
| handler | => | action | => | query | => | transform |
 ---------      --------      -------      -----------
```

This pattern is a layered design that keeps concerns separate and makes modules easy to test and reason about.
The key is that each layer N can only talk to layer N-1, not any further.
Handlers should not talk to transforms then to queries or anything crazy like that.
Also main parts of the application or other modules should not talk directly to you query or
action modules.
Everything starts from the Handler then flows through the rest of the layers until something
is returned. Each layer only knows about the next layer in the system.

In Elixir I think of this in the same way we use pipelines

```
  event
  |> handlers
  |> actions
  |> queries
  |> transforms
```

The dir structure helps keep the modules organized
when you get a bunch.

```
 lib/
   registration/
     actions.ex
     handlers.ex
     queries.ex
     transforms.ex
   user/
     actions.ex
     handlers.ex
     queries.ex
     transforms.ex
   sponsor/
     actions.ex
     handlers.ex
     queries.ex
     transforms.ex
```

### `handlers.ex`

The `handlers.ex` file is concerned with receiving requests, retrieving the necessary data from a request, and calling into the appropriate action with that input.

In this specific case the handler is handling input data from a request object and sending back responses via the response object because this is used in the context of a simple API.

This pattern can also be used in many other cases such, receiving data from a queue, a pub-sub adapter, or an event bus like kafka.


### `actions.ex`

The `actions.ex` file is concerned with performing actions and returning all the data needed for a response from those actions. Every action should return everything needed for a handler to return a response. This includes error handling.
The actions file has access to the queries and is able to compose queries to get the data it needs for the handler. This could include calling queries to verify user permissions before calling an update query.


### `queries.ex`

The `queries.ex` file is concerned with executing queries into the persistence layer and returning data from that execution. This layer can access the transforms and use the transforms to change the data into different forms. With this pattern the queries do not have to wrap a DB-- they can be calls to another API, in-memory storage, flat file, s3 bucket, Dropbox, or whatever.


### `transforms.ex`

The `transforms.ex` file is concerned with massaging data from one format to another. This usually has a pattern of `fromThisToThat(this)` and `fromThatToThis(that)`. These functions can be used by the queries before writing to the persistence layer and after getting data back before returning to the action. A transform should be created/used only when needed.
