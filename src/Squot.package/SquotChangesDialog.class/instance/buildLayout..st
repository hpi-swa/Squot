toolbuilder
buildLayout: builder
	| buttonBarOffset changesHeight commitMessageHeight treeWidth |
	buttonBarOffset := builder buttonRowHeight negated.
	treeWidth := 0.3.
	commitMessageHeight := 0.3.
	changesHeight := 1 - commitMessageHeight.
	^ {
		(LayoutFrame fractions: (0 @ 0 corner: treeWidth @ changesHeight))
			-> {self buildChangesTree: builder}.
		(LayoutFrame fractions: (treeWidth @ 0 corner: 1 @ changesHeight))
			-> #buildChangePane.
		(LayoutFrame fractions: (0 @ changesHeight corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ buttonBarOffset))
			-> {self buildCommitMessage: builder}.
		(LayoutFrame fractions: (0 @ 1 corner: 1 @ 1) offsets: (0 @ buttonBarOffset corner: 0 @ 0))
			-> {self buildButtons: builder}.
	} collect: [:part | builder pluggablePanelSpec new
						model: self;
						frame: part key;
						children: part value;
						yourself]