package utils

import (
	"strings"
)

// Wraps single line texts into boxes
func WrapInBox(txt string) string {
	var top = "╔" + strings.Repeat("═", len(txt)+2) + "╗\n"
	var middle = "║ " + txt + " ║\n"
	var bottom = "╚" + strings.Repeat("═", len(txt)+2) + "╝\n"

	return top + middle + bottom
}
