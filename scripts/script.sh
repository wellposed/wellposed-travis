#! /bin/bash

if [[ $GHCVER == "head" || -n "$SKIP_HADDOCK" ]]
  then
    DOCBUILD="echo 'Skipping docs...'"
  else
    DOCBUILD="$CABAL haddock"
fi

$CABAL configure --enable-tests --enable-benchmarks -v2 $CABAL_FLAGS\
  && $CABAL build --ghc-options='-Wall -Werror'\
  && $CABAL test\
  # && $DOCBUILD\ #this isn't working for now, so disable for now
  && $CABAL check\
  && $CABAL sdist
