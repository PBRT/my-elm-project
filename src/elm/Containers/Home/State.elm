module Containers.Home.State exposing (..)

import State.Types as T
import Containers.Home.Types as HomeTypes

model : HomeTypes.Model
model = { number = 0 }

update : HomeTypes.Msg -> HomeTypes.Model -> HomeTypes.Model
update msg model =
  case msg of
    HomeTypes.IncrementHome -> { model | number = model.number + 1}
