module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String exposing (toInt)


type alias Model =
    { inputValue : Int
    , total : Int
    }


initModel : Model
initModel =
    { inputValue = 0
    , total = 0
    }


type Msg
    = AddCalorie
    | Clear
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model | total = model.total + model.inputValue }

        Clear ->
            { model | total = 0 }

        Change num ->
            case (String.toInt num) of
                Ok val ->
                    { model | inputValue = val }

                Err _ ->
                    model


view : Model -> Html Msg
view model =
    div []
        [ h3
            []
            [ text ("Total Calories: " ++ toString model.total) ]
        , input
            [ placeholder "Enter Calories here: ", onInput Change ]
            []
        , button
            [ type' "button", onClick AddCalorie ]
            [ text "Add" ]
        , button
            [ type' "button", onClick Clear ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
