toolbuilder
buildLayout: builder
	| buttonBarOffset |
	buttonBarOffset := builder buttonRowHeight negated.
	^ {
		(LayoutFrame fractions: (0@0 corner: 0.5@1) offsets: (0@0 corner: 0 @ buttonBarOffset))
			-> {self buildChangesTree: builder}.
		(LayoutFrame fractions: (0.5@0 corner: 1@1) offsets: (0@0 corner: 0 @ buttonBarOffset))
			-> #buildChangePane.
		(LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0 @ buttonBarOffset corner: 0@0))
			-> {self buildButtons: builder}.
	} collect: [:part | builder pluggablePanelSpec new
						model: self;
						frame: part key;
						children: part value;
						yourself]