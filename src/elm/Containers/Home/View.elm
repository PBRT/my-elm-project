module Containers.Home.View exposing (..)

import Html exposing (..)
import Basics exposing ( toString )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

import State.Types as T
import Containers.Home.Types as HomeTypes

-- hello component
home : HomeTypes.Model -> Html T.Msg
home model =
  let test = model.number in
  div [] [
    div [ class "classic-container" ] [
      div [ style [("marginBottom", "10px")]] [ text("Current number: " ++ toString test) ]
      , button [ class "btn btn-primary btn-lg"
                , onClick (T.Home <| HomeTypes.IncrementHome) ]
                [ text("Increment me")]
    ]
    , div [ class "classic-container" ] [
        div [ style [("marginBottom", "10px")]] [ text("Current number: " ++ toString test) ]
        , button [ class "btn btn-primary btn-lg"
                  , onClick (T.FetchTodos) ]
                  [ text("Fetch todos")]
      ]
  ]
