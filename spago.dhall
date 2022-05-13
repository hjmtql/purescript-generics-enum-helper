{ name = "generics-enum-helper"
, dependencies =
  [ "arrays"
  , "assert"
  , "effect"
  , "enums"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "unfoldable"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
