module Main exposing (main)

import Html exposing (Html)
import Html.Events
import Html.Attributes


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { message : String , say : String }


model : Model
model =
    { message = "Hello Steger!" , say = "" }



-- UPDATE


type Msg
    = Noop
    | Backwards
    | Say String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Noop ->
            model

        Backwards ->
            { model | message = "!regetS olleH" }

        Say string ->
            { model | say = string }



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ backwardsButton
        , Html.h1 []
            [ Html.text
                model.message
            ]
        ]


backwardsButton : Html Msg
backwardsButton =
    Html.button
        [ Html.Events.onClick Backwards
        , Html.Attributes.id "backwards"
        ]
        [ Html.text "Backwards" ]


sayInput : Model -> Html Msg
sayInput model =
    Html.input
        [ Html.Attributes.id "say"
        , Html.Events.onInput Say
        , Html.Attributes.value model.say
        ]
        []

