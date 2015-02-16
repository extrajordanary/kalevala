module GameTypes where

import Dict
import Dict (Dict)
import Random (Seed)

type GameType = HumanVsCpu
              | HumanVsHumanLocal
              | HumanVsHumanRemote

type GameState = NotStarted
               | WaitingForPlayers
               | Ongoing
               | GameOver
               | Disconnected

type PlayerType = Human
                | Cpu
                | Remote

type Player = Red
            | Blue

type alias Move = { piece : Piece, idx : Int, location : Location }
type alias Location = (Int, Int)

type alias Board = Dict Location Piece
type alias Score = Dict String Int
type alias Deck = List String
type alias Hands = Dict String (List String)

type alias State = {
  gameType : GameType,
  gameState : GameState,
  players : Dict String PlayerType,
  turn : Player,
  board : Board,
  score : Score,
  deck : Deck,
  hands : Hands,
  heldPiece : Maybe Int,
  lastPlaced : Maybe Location,
  delta : Dict String String
}

type Piece = Odin
           | Thor
           | Troll
           | Dragon
           | Fenrir
           | Skadi
           | Valkyrie
           | Loki
           | NoPiece  -- represents error in board lookup

type alias MousePos = (Int, Int)
type alias WindowDims = (Int, Int)

type Action = PickUpPiece Player Int
            | PlacePiece MousePos WindowDims
            | StartGame GameType Deck Player
            | GameStarted Deck Player Player -- represents a StartGame message sent from the server
            | Pass
            | OpponentDisconnected
            | NoAction
            | ParseError String

type ClickEvent = Start
                | BoardClick
                | PieceInHand Player Int
                | PassButton
                | None
