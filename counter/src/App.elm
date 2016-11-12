module App exposing (..)

import Html exposing (Html, text, div, h1, button, a)
import Html.Attributes exposing (href, style)
import Html.Events exposing (onClick)
import Material
import Material.Scheme
import Material.Layout as Layout
import Material.Button as Button


type alias Model =
    { count : Int
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { count = 0
      , mdl = Material.model
      }
    , Material.init Mdl
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
        Layout.render Mdl
            model.mdl
            [ Layout.fixedHeader
            , Layout.fixedDrawer
            ]
            { header = header model
            , drawer = drawer model
            , tabs = ( [], [] )
            , main = [ counterView model ]
            }


drawer : Model -> List (Html Msg)
drawer model =
    [ Layout.navigation
        []
        [ Layout.link
            [ Layout.href "http://getmdl.io" ]
            [ text "MDL Docs" ]
        ]
    ]


header : Model -> List (Html Msg)
header model =
    [ Layout.row
        []
        [ Layout.title [] [ text "DevFest Counts Things" ]
        ]
    ]


counterView : Model -> Html Msg
counterView model =
    div
        [ style [ ( "padding", "1em" ) ] ]
        [ Button.render Mdl
            [ 0 ]
            model.mdl
            [ Button.raised
            , Button.colored
            , Button.onClick Decrement
            ]
            [ text "-" ]
        , div
            [ style [ ( "padding", "1em" ), ( "display", "inline-block" ) ] ]
            [ text <| toString model.count ]
        , Button.render Mdl
            [ 1 ]
            model.mdl
            [ Button.raised
            , Button.colored
            , Button.onClick Increment
            ]
            [ text "+" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Material.subscriptions Mdl model
