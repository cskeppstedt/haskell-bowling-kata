dev:
	ag -l --haskell --ignore-dir dist | entr -c make test-all

test-all:
	cabal configure --enable-tests && cabal build && cabal test --show-details=always --test-option=--color
