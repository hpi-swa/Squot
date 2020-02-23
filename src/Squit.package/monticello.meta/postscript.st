(PackageInfo named: 'Squit') postscript: '"below, add code to be run after the loading of this package"
"2019-10-03: remove cached snapshots because the new property loadOrder was introduced"
SquitRepository allInstancesDo: [:each | each flushCaches].

"2020-02-23: Squeak 5.3 depracates ToolSet>>debugError: in favor of handleError:, but that didn''t exist in previous versions. Delegate back for older versions."
((ToolSet respondsTo: #handleError:) not and: [ToolSet respondsTo: #debugError:]) ifTrue:
	[ToolSet class
		compile: ''handleError: anError
	"Method is new in Squeak 5.3. Compatibility method added by the package ''''Squit''''."
	^ self debugError: anError''
		classified: ''debugging - handlers''].
'!
