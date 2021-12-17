*Squot-CoAuthorsExtension
buildCoAuthorSelector: builder
	| coAuthorBar selectCoAuthorsButton |
	coAuthorBar := builder pluggablePanelSpec new
		layout: #horizontal;
		children: OrderedCollection new;
		frame: (LayoutFrame fractions: (0.8@0.7 corner: 1@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	
	selectCoAuthorsButton := builder pluggableActionButtonSpec new
		name: 'co-authors for this commit';
		model: self;
		label: 'Add Co-Authors';
		action: #appendCoAuthors;
		yourself.
		
	coAuthorBar children addAll: {selectCoAuthorsButton}.
	^ coAuthorBar