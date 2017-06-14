module State.Types exposing (..)

import Containers.Home.Types as HomeTypes

import Navigation exposing (Location)

-- ACTIONS types
type Msg
  = NoOp
  | OnLocationChange Location
  -- HOME ACTIONS
  | Home HomeTypes.Msg
  | FetchTodos


-- ROUTES types
type Route
    = HomeRoute
    | TestRoute
    | NotFoundRoute


-- MODEL
type alias Model =
  { home : HomeTypes.Model
  , route : Route
}

