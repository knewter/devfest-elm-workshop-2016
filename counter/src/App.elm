module App exposing (..)

import Html exposing (Html, text, div, h1, button)
import Html.Events exposing (onClick)
import Material.Scheme
import Material


type alias Model =
    { count : Int
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { count = 0
      , mdl = Material.model
      }
    , Cmd.none
    )


type Msg
    = Increment
    | Decrement
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )

        Mdl mdlMsg ->
            Material.update mdlMsg model


view : Model -> Html Msg
view model =
    Material.Scheme.top <|
        div []
            [ h1 [] [ text "DevFest Counts Things" ]
            , button [ onClick Decrement ] [ text "-" ]
            , text <| toString model.count
            , button [ onClick Increment ] [ text "+" ]
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
