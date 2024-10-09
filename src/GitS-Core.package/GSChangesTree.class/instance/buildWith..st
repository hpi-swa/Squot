toolbuilder
buildWith: builder
	| innerSpec builtChildren |
	builtChildren := self buildChildren: builder.
	innerSpec := (GSGUIUtilities
					buildVerticalLayout: (builtChildren first: self nonDelayedChildrenCount)
					with: builder)
						spacing: self childrenGap;
						yourself.
	^ GSDelayedBuilder
		build: (builtChildren allButFirst: self nonDelayedChildrenCount)
		into: innerSpec