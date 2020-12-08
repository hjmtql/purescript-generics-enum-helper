module Data.Generic.EnumHelper
  ( values
  , write
  , read
  ) where

import Prelude
import Data.Array (mapMaybe)
import Data.Foldable (findMap)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Bounded (class GenericBottom, class GenericTop, genericBottom, genericTop)
import Data.Generic.Rep.Enum (class GenericBoundedEnum, genericFromEnum, genericToEnum)
import Data.Generic.Rep.Show (class GenericShow, genericShow)
import Data.Maybe (Maybe(..))
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
