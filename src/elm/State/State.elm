module State.State exposing (..)

-- Types
import State.Types as T

-- States
import Containers.Home.State as HomeState
import Containers.Home.Rest as Rest

model : T.Model
model = { home =  HomeState.model }

-- MAIN MULTIPLEXER
update : T.Msg -> T.Model -> (T.Model, Cmd T.Msg)
update msgFor model =
  case msgFor of
    T.FetchTodos -> (model, Rest.fetchTodos)
    T.Home msg -> ({ model | home = HomeState.update msg model.home }, Cmd.none)
    _ -> (model, Cmd.none)
