toolbuilder
buildWith: builder
	| innerSpec builtChildren |
	builtChildren := self buildChildren: builder.
	innerSpec := (SquotGUIUtilities
					buildVerticalLayout: (builtChildren first: self nonDelayedChildrenCount)
					with: builder)
						spacing: self childrenGap;
						yourself.
	^ SquotDelayedBuilder
		build: (builtChildren allButFirst: self nonDelayedChildrenCount)
		into: innerSpec