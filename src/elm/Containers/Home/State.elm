module Containers.Home.State exposing (..)

import RemoteData exposing (WebData)
import Containers.Home.Types as HomeTypes

model : HomeTypes.Model
model = { number = 0, todos =  RemoteData.Loading }

update : HomeTypes.Msg -> HomeTypes.Model -> HomeTypes.Model
update msg model =
  case msg of
    HomeTypes.IncrementHome -> { model | number = model.number + 1}
    HomeTypes.OnFetchTodos response -> { model | todos = response }
