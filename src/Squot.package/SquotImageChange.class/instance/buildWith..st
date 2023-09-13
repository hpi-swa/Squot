toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		color: Color white;
		layout: #vertical;
		children: ({
			(self pathString, String lf, 'Old:') -> #buildFrom.
			'New:' -> #buildTo.
		} gather: [:each | {
			self buildText: each key with: builder.
			self buildDynamicVersion: each value with: builder.
		}]);
		frame: LayoutFrame fullFrame;
		yourself