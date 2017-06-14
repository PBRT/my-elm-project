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

-- MODEL
type alias Model =
  { home : HomeTypes.Model
  , route : Route
}

-- ROUTES
type Route
    = HomeRoute
    | TestRoute
    | NotFoundRoute
