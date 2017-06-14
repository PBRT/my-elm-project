module Containers.TestPage.View exposing (..)

import Html exposing (..)

import State.Types as T

testPage : Html T.Msg
testPage =
    div []
        [ text "Test PAge"
        ]
