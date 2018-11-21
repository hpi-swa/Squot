(PackageInfo named: 'Squit') postscript: '"below, add code to be run after the loading of this package"
"10/03/19: remove cached snapshots because the new property loadOrder was introduced"
SquitRepository allInstancesDo: [:each | each flushCaches].'!
