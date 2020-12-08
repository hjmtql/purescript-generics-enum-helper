{ name = "generics-enum-helper"
, dependencies = [ "arrays", "assert", "console", "effect", "generics-rep" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
