module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)

import State.Types as T

matchers : Parser (T.Route -> a) a
matchers =
    oneOf
        [ map T.HomeRoute top
        , map T.TestRoute (s "test")
        ]


parseLocation : Location -> T.Route
parseLocation location =
      case (parseHash matchers location) of
          Just route ->
              route
          Nothing ->
              T.NotFoundRoute
