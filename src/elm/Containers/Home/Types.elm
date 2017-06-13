module Containers.Home.Types exposing (..)

import Http
import RemoteData exposing (WebData)

type alias Todo = { id: Int, userId: Int, body: String, title: String }

type Msg
  = IncrementHome
  | OnFetchTodos (WebData (List Todo))

-- MODEL
type alias Model = { number: Int, todos:  WebData (List Todo) }
