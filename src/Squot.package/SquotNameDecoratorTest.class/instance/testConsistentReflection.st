tests
testConsistentReflection
	| decorated1 decorated2 instSize |
	decorated1 := SquotNameDecorator on: 1 withName: 'foo'.
	instSize := decorated1 class instSize.
	1 to: instSize do: [:each | self shouldnt: [decorated1 instVarAt: each] raise: Error].
	decorated2 := SquotNameDecorator on: 'foo' withName: 'bar'.
	1 to: decorated2 basicSize do: [:each | self shouldnt: [decorated1 basicAt: each] raise: Error].