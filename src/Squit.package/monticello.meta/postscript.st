(PackageInfo named: 'Squit') postscript: '"below, add code to be run after the loading of this package"
"2019-10-03: remove cached snapshots because the new property loadOrder was introduced"
SquitRepository allInstancesDo: [:each | each flushCaches].
"2019-06-08: flush caches because there were changes to assigning object names to package shadows in snapshots"
Transcript open; show: ''2019-06-08: flush caches because there were changes to assigning object names to package shadows in snapshots''.'!
