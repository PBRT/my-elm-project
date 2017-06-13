module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
-- App custom
import State.Types as T
import State.State as S

-- component import example
import Components.Navigation exposing ( navigation )

-- Pages
import Containers.Home.View exposing ( home )

-- INIT
init : ( T.Model, Cmd T.Msg )
init = ( S.model , Cmd.none )

-- VIEW
view : T.Model -> Html T.Msg
view model =
  div [ class "container", style [("margin-top", "60px"), ( "text-align", "center" )] ][    -- inline CSS (literal)
    div [] [ navigation "Increment" ]
    , div [ class "row" ][
      div [ class "col-xs-12" ][
        home model.home
      ]
    ]
  ]

-- SUBSCRIBTIONS
subscriptions : T.Model -> Sub T.Msg
subscriptions model = Sub.none

-- APP
main : Program Never T.Model T.Msg
main =
  program
    { view = view
    , update = S.update
    , init = init
    , subscriptions = subscriptions
    }
