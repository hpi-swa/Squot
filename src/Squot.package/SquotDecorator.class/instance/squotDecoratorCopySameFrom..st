copying
squotDecoratorCopySameFrom: otherObject
	"Copy of Object>>copySameFrom: but with #squotDecoratorClass instead of #class."

	| myInstVars otherInstVars |
	myInstVars := self squotDecoratorClass allInstVarNames.
	otherInstVars := otherObject squotDecoratorClass allInstVarNames.
	myInstVars doWithIndex: [:each :index |
		| match |
		(match := otherInstVars indexOf: each) > 0 ifTrue:
			[self instVarAt: index put: (otherObject instVarAt: match)]].
	1 to: (self basicSize min: otherObject basicSize) do: [:i |
		self basicAt: i put: (otherObject basicAt: i)].
