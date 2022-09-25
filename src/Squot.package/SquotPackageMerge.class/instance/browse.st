*Squot-Tools
browse
	| merger browser |
	merger := MCThreeWayMerger base: working asMCSnapshot target: incoming asMCSnapshot ancestor: base asMCSnapshot.
	browser := MCMergeBrowser new.
	browser merger: merger.
	browser show.