toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		color: Color white;
		layout: #vertical;
		children: ({
			(self pathString, String lf, 'Old:') -> self from.
			'New:' -> self to.
		} gather: [:each | {
			self buildText: each key with: builder.
			self buildVersion: each value with: builder.
		}]);
		frame: LayoutFrame fullFrame;
		yourself