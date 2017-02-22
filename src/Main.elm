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
    { message : String }


model : Model
model =
    { message = "Hello Steger!" }



-- UPDATE


type Msg
    = Noop
    | Backwards


update : Msg -> Model -> Model
update msg model =
    case msg of
        Noop ->
            model

        Backwards ->
            { model | message = "!regetS olleH" }



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
