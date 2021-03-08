module Data.Generic.EnumHelper
  ( values
  , write
  , read
  ) where

import Prelude
import Data.Array (mapMaybe)
import Data.Bounded.Generic (class GenericBottom, class GenericTop, genericBottom, genericTop)
import Data.Enum.Generic (class GenericBoundedEnum, genericFromEnum, genericToEnum)
import Data.Foldable (findMap)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Show.Generic (class GenericShow, genericShow)
import Data.Unfoldable1 (range)

values ::
  forall a rep.
  Generic a rep =>
  GenericBottom rep =>
  GenericTop rep =>
  GenericBoundedEnum rep =>
  Array a
values =
  mapMaybe genericToEnum
    $ range (gfe genericBottom) (gfe genericTop)
  where
  gfe :: a -> Int
  gfe = genericFromEnum

write ::
  forall a rep.
  Generic a rep =>
  GenericShow rep =>
  a -> String
write = genericShow

read ::
  forall a rep.
  Generic a rep =>
  GenericShow rep =>
  GenericBottom rep =>
  GenericTop rep =>
  GenericBoundedEnum rep =>
  String -> Maybe a
read s = findMap f values
  where
  f c
    | s == write c = Just c
    | otherwise = Nothing
