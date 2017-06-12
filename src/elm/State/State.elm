module State.State exposing (..)

-- Types
import State.Types as T

-- States
import Containers.Home.State as HomeState

model : T.Model
model = { home =  HomeState.model }

-- MAIN MULTIPLEXER
update : T.Msg -> T.Model -> (T.Model, Cmd T.Msg)
update msgFor model =
  case msgFor of
    T.Home msg -> ({ model | home = HomeState.update msg model.home }, Cmd.none)
    _ -> (model, Cmd.none)
