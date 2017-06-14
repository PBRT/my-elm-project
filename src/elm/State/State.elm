module State.State exposing (..)

import Config.Routing as Routing
import Navigation exposing (Location)

-- Types
import State.Types as T

-- States
import Containers.Home.State as HomeState
import Containers.Home.Rest as Rest

-- MAIN MULTIPLEXER
update : T.Msg -> T.Model -> (T.Model, Cmd T.Msg)
update msgFor model =
  case msgFor of
    T.FetchTodos -> (model, Rest.fetchTodos)
    T.Home msg -> ({ model | home = HomeState.update msg model.home }, Cmd.none)
    T.OnLocationChange location ->
        let
          newRoute = Routing.parseLocation location model
          cmd = Routing.getCmdFromRoute newRoute
        in
          ( { model | route = newRoute }, cmd )
    _ -> (model, Cmd.none)

-- INIT
initialModel : T.Route -> T.Model
initialModel route =
    { home =  HomeState.model
    , route = route
    }

model: T.Model
model = { home = HomeState.model, route = T.HomeRoute}


init : Location -> ( T.Model, Cmd T.Msg )
init location =
    let
      currentRoute = Routing.parseLocation location model
      cmd = Routing.getCmdFromRoute currentRoute
    in
        ( initialModel currentRoute, cmd )


-- SUBSCRIBTIONS
subscriptions : T.Model -> Sub T.Msg
subscriptions model = Sub.none
