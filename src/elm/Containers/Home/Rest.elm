module Containers.Home.Rest exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Containers.Home.Types as HomeTypes
import State.Types as T
import RemoteData

fetchTodos : Cmd T.Msg
fetchTodos =
    Http.get fetchTodosUrl todosDecoder
        |> RemoteData.sendRequest
        |> Cmd.map HomeTypes.OnFetchTodos
        |> Cmd.map T.Home

fetchTodosUrl : String
fetchTodosUrl =
    "https://jsonplaceholder.typicode.com/posts"


todosDecoder : Decode.Decoder (List HomeTypes.Todo)
todosDecoder =
    Decode.list todoDecoder


todoDecoder : Decode.Decoder HomeTypes.Todo
todoDecoder =
    decode HomeTypes.Todo
        |> required "id" Decode.int
        |> required "userId" Decode.int
        |> required "body" Decode.string
        |> required "title" Decode.string

