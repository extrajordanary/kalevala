module Serialize where

import Dict
import List (..)
import Json.Encode (..)

import Helpers (..)
import GameTypes (..)

action : Action -> Value
action a =
  case a of
    PickUpPiece pl idx -> 
      object [("action", string "PickUpPiece"), ("player", player pl), ("idx", int idx)]
    PlacePiece mousePos dims -> 
      object [("action", string "PlacePiece"), ("mousePos", intPair mousePos), ("dims", intPair dims)]
    StartGame d pl -> 
      object [("action", string "StartGame"), ("deck", deck d), ("player", player pl)]
    Pass -> 
      object [("action", string "Pass")]
    NoAction -> 
      object [("action", string "NoAction")]

deck : Deck -> Value
deck = list << map string

player : Player -> Value
player = string << playerName

intPair : (Int, Int) -> Value
intPair (x, y) = list <| map int [x, y]
