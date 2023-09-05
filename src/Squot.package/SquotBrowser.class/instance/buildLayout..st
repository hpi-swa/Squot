toolbuilder
buildLayout: builder
	| buttonBarOffset |
	buttonBarOffset := builder buttonRowHeight negated.
	^ {
		(LayoutFrame fullFrame bottomFraction: 1 offset: buttonBarOffset)
			-> {self buildCommitList: builder}.
		(LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0 @ buttonBarOffset corner: 0@0))
			-> {self buildButtons: builder}.
	} collect: [:part | builder pluggablePanelSpec new
						frame: part key;
						children: part value;
						yourself]