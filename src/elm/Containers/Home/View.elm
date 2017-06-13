module Containers.Home.View exposing (..)

import Html exposing (..)
import List exposing (..)
import Basics exposing ( toString )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )
import RemoteData exposing (WebData)

import State.Types as T
import Containers.Home.Types as HomeTypes

spinner: Html T.Msg
spinner = div [class "spinner-container", style [("marginLeft", "40px")]] [
    span [ class "spinner glyphicon glyphicon-repeat" ] []
  ]

renderTodo: HomeTypes.Todo -> Html T.Msg
renderTodo todo = div [class "list-group-item"] [(text todo.title)]

maybeList : WebData (List HomeTypes.Todo) -> Html T.Msg
maybeList response =
  case response of
    RemoteData.NotAsked -> text ""
    RemoteData.Loading -> spinner
    RemoteData.Success todos -> div [class "list-group list"] (List.map renderTodo todos)
    RemoteData.Failure error -> text "Something went wrong"

-- hello component
home : HomeTypes.Model -> Html T.Msg
home model =
  let test = model.number in
  div [] [
    div [ class "classic-container" ] [
      button [ class "btn btn-primary"
              , style [("marginRight", "10px"), ("width", "120px")]
              , onClick (T.Home <| HomeTypes.IncrementHome) ]
             [ text("Increment me")]
      , div [ class "inline"] [ text("Current number: " ++ toString test) ]
    ]
    , div [ class "classic-container" ] [
        button [ class "btn btn-primary"
                , style [("marginRight", "10px"), ("width", "120px")]
                , onClick (T.FetchTodos) ]
                [ text("Fetch todos")]
        , maybeList model.todos
      ]
  ]

-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }

