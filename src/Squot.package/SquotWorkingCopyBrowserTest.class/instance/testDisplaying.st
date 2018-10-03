testing
testDisplaying
	| toolBuilder view |
	"given"
	workingCopy add: Object new at: 'an object'.
	"when"
	toolBuilder := ToolBuilder default.
	view := toolBuilder build: browser.
	"then do not signal errors"