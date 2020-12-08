module Test.Main where

import Prelude
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Generic.EnumHelper (read, values, write)
import Effect (Effect)
import Test.Assert (assertEqual)

data Color
  = Red
  | Yellow
  | Blue

derive instance genericColor :: Generic Color _

derive instance eqColor :: Eq Color

instance showColor :: Show Color where
  show = genericShow

main :: Effect Unit
main = do
  assertEqual
    { actual: values
    , expected: [ Red, Yellow, Blue ]
    }
  assertEqual
    { actual: read "Red"
    , expected: Just Red
    }
  assertEqual
    { actual: read "Yellow"
    , expected: Just Yellow
    }
  assertEqual
    { actual: read "Blue"
    , expected: Just Blue
    }
  assertEqual
    { actual: read "red" :: Maybe Color
    , expected: Nothing
    }
  assertEqual
    { actual: write Red
    , expected: "Red"
    }
  assertEqual
    { actual: write Yellow
    , expected: "Yellow"
    }
  assertEqual
    { actual: write Blue
    , expected: "Blue"
    }
