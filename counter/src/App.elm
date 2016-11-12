module App exposing (..)

import Html exposing (Html, text, div, h1, button)
import Html.Events exposing (onClick)
import Material.Scheme


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


view : Model -> Html Msg
view model =
    Material.Scheme.top <|
        div []
            [ h1 [] [ text "DevFest Counts Things" ]
            , button [ onClick Decrement ] [ text "-" ]
            , text <| toString model
            , button [ onClick Increment ] [ text "+" ]
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
