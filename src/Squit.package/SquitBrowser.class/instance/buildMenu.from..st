ui menu
buildMenu: aMenu from: commands
	"Create a menu from an array of arrays that define commands.
	Each item should be {'label'. #selector. 'help text'. trueIfEnabledFalseOtherwise}
	(only the first two items are mandatory)."
	commands
		do: [:each | 
			each = '-'
				ifTrue: [aMenu addLine]
				ifFalse: [(each at: 4 ifAbsent: [true])
						ifTrue: [aMenu addList: {(each first: (3 min: each size))}]]]