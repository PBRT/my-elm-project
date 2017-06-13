module State.Types exposing (..)

import Containers.Home.Types as HomeTypes

-- ACTIONS types
type Msg
  = NoOp
  | Home HomeTypes.Msg
  | FetchTodos

-- MODEL
type alias Model = {
  home: HomeTypes.Model
}
