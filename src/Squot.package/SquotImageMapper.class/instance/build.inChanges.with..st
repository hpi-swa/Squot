changes-operations
build: key inChanges: aCollection with: builder
	| change old new |
	change := aCollection first.
	old := change key.
	new := change value.
	^ builder pluggablePanelSpec new
		color: Color white;
		layout: #vertical;
		children: ({
			(self path asReference pathString, String lf, 'Old:') -> old.
			'New:' -> new.
		} gather: [:each | {
			builder pluggableTextSpec new
				model: each key;
				getText: #yourself;
				verticalResizing: #shrinkWrap;
				yourself.
			builder pluggableScrollPaneSpec new
				morph: (each value
							ifNil: ['Missing' asText addAttribute: TextEmphasis italic; yourself])
							asMorph;
				padding: 10;
				yourself.
		}]);
		frame: LayoutFrame fullFrame;
		yourself