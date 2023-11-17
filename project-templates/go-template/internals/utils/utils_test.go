package utils

import (
	"testing"
)

func TestWrapInBox(t *testing.T) {
	input := "Hello World"
	expected := "╔═════════════╗\n║ Hello World ║\n╚═════════════╝\n"
	actual := WrapInBox(input)

	if actual != expected {
		t.Errorf("Expected: %s. Got: %s", expected, actual)
	}
}
