{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-webpack-loader-api"
, dependencies =
  [ "aff"
  , "aff-promise"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "foreign"
  , "foreign-object"
  , "node-buffer"
  , "node-path"
  , "prelude"
  , "psci-support"
  , "transformers"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
