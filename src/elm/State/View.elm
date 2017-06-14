module State.View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (..)
import State.Types as T

-- PAGES
import Containers.NotFound.View exposing (notFound)
import Containers.Home.View exposing (home)
import Containers.TestPage.View exposing (testPage)

-- COMPONENTS
import Components.Navigation exposing ( navigation )


view : T.Model -> Html T.Msg
view model =
    div [ class "container", style [("margin-top", "60px"), ( "text-align", "center" )] ][    -- inline CSS (literal)
      div [] [ navigation "Increment" ]
      , div [ class "row" ][
        div [ class "col-xs-12" ][
          page model
        ]
      ]
    ]


page : T.Model -> Html T.Msg
page model =
    case model.route of
        T.HomeRoute ->
          home model.home

        T.TestRoute ->
          testPage

        T.NotFoundRoute ->
          notFound
