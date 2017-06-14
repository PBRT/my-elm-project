module Config.Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)

import State.Types as T
import Containers.Home.Rest as Rest

-- Mach routes from url
matchers : Parser (T.Route -> a) a
matchers =
    oneOf
        [ map T.HomeRoute top
        , map T.TestRoute (s "test")
        ]

-- Find route from hash
parseLocation : Location -> T.Model -> T.Route
parseLocation location model =
      case (parseHash matchers location) of
          Just route ->
              route
          Nothing ->
              T.NotFoundRoute

-- Command to run when the route is loaded
getCmdFromRoute: T.Route -> (Cmd T.Msg)
getCmdFromRoute route =
  case route of
    T.HomeRoute -> Rest.fetchTodos
    T.TestRoute -> Cmd.none
    T.NotFoundRoute -> Cmd.none


