module Components.Navigation exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

navigation: String -> Html div
navigation model =
  div [ class "navbar-container" ] [
    div [ class "navbar navbar-default" ] [
      div [ class "container-fluid" ] [
          div [ class "navbar-header" ][
            a
            [ class "navbar-brand pointer", href "#"]
            [ text "KICKSTARTER" ]
          ]
          , div [ class "collapse navbar-collapse" ] [
            ul [ class "nav navbar-nav navbar-right" ] [
              li [] [
                a [ href "#test" ] [ text "Test Page"]
              ]
              , li [] [
                a [ href "http://google.com", target "_blank" ] [ text "Login"]
              ]
            ]
          ]
      ]
    ]
  ]
