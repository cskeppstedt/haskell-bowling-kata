all: clean test

test: configure build
	cabal test --show-details=always --test-option=--color

clean:
	cabal clean

build:
	cabal build

configure:
	cabal configure --enable-tests

dev:
	ag -l --haskell --ignore-dir dist | entr -c make -s test
