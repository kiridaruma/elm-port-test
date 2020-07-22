port module Main exposing (..)

import Browser exposing (..)
import Html exposing (Html, div, p, button, text)
import Html.Events exposing (onClick)

type alias Model =
    { msg: String
    }

type Msg
    = Message String
    | StartSound

port handleMsg : (String -> msg) -> Sub msg

port startSound : () -> Cmd msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
       Message str -> ({msg = str}, Cmd.none)
       StartSound -> (model, startSound ())

view: Model -> Html Msg
view m = div []
    [ p [] [text m.msg]
    , button [onClick StartSound] [text "再生！"]
    ]

main = element
    { init = \()->({msg=""}, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \_ -> handleMsg Message
    }
