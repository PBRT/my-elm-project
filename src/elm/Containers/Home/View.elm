module Containers.Home.View exposing (..)

import Html exposing (..)
import List exposing (..)
import Basics exposing ( toString )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )
import RemoteData exposing (WebData)

import State.Types as T
import Containers.Home.Types as HomeTypes

renderTodo: HomeTypes.Todo -> Html T.Msg
renderTodo todo = div [] [(text todo.title)]

maybeList : WebData (List HomeTypes.Todo) -> Html T.Msg
maybeList response =
  case response of
    RemoteData.NotAsked -> text ""
    RemoteData.Loading -> text "Loading..."
    RemoteData.Success todos -> div [] (List.map renderTodo todos)
    RemoteData.Failure error -> text (toString error)

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
        , maybeList model.todos
      ]
  ]
