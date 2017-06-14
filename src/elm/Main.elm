module Main exposing (..)

import Navigation exposing (Location)

-- App custom
import State.Types as T
import State.State as S
import State.View as V

-- APP
main : Program Never T.Model T.Msg
main =
  Navigation.program T.OnLocationChange
    { view = V.view
    , update = S.update
    , init = S.init
    , subscriptions = S.subscriptions
    }
