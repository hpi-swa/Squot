# Squot [![Build Status][travis_badge]][travis]
Squeak Object Tracker - Version control for arbitrary objects in Squeak, currently with Git storage

This repository also contains a variant of the FileSystem library,
which is an alternative to the FileDirectory API and has replaced the latter in Pharo.
However, our version of the FileSystem library descends from the last version of it for Squeak
and is not compatible with Pharo's FileSystem classes.

The package that provides Git connectivity for Squot is named Squit.
It uses the package FileSystem-Git (also included here) to browse and manipulate Git repositories.

## Installation instructions

You will need a Squeak trunk image that is newer than 2017-03-12. The image's version number should be at about 17037 or higher.

First install the latest [Metacello](//github.com/dalehenrich/metacello-work), then you can use the following code to load Squot and all its prerequisites:

```smalltalk
Metacello new
  baseline: 'Squot';
  repository: 'github://hpi-swa/Squot:master/src';
  load.
```

## Usage instructions

The Squit package comes with a tool called "Git Browser"
that can be opened from the Apps menu of the world's main docking bar.
It allows to add and manage working copies and branches, create new commits,
merge versions and synchronize (fetch, pull, push) with remotes.
The buttons and context menu commands are labelled with Git terminology.
For example, it uses the term "commit", while the term used for such an object
in the Squot code and other Smalltalk version control systems like Monticello or ENVY is "version".

If your local Git repository has a working copy in the file system,
this working copy and the Git index will not be automatically updated by Squot.
Squot currently treats each Git repository as if it were a bare repository (without a working copy).
You will therefore experience that the working copy is out-of-date in the file system
when you commit with Squot to the branch that is checked-out in the file system.
If you need an up-to-date file working copy, you can fix the situation with `git reset --hard`
unless you must first save some uncommitted changes to your files.

If you want to use Squot from a workspace or in your code, here are some hints:
Squot uses an ImageStore to remember objects (including packages) that should be tracked.
A WorkingCopy combines such a store with a repository, for example a SquitRepository (a Git repository).

Squot is based on [an abstraction for version control systems named Pur](https://publishup.uni-potsdam.de/frontdoor/index/index/docId/5708)
which coins the term "historian" for label-based branches, such as Git's head references.
Selectors that deal with branches therefore include "historian" instead of "branch".

```smalltalk
workingCopy := SquotWorkingCopy new.
workingCopy store: SquotImageStore new.
workingCopy repository:
  (SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git').
workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master').
workingCopy add: (PackageInfo named: 'YourPackage') at: 'src'.
workingCopy add: (PackageInfo named: 'AnotherPackage') at: 'src'.
workingCopy add: anyObject at: 'objects/myObject'.
workingCopy saveNewVersionInteractively.
workingCopy loadCurrentVersionInteractively.
```

Note that Monticello versions will be created in the package cache repository
whenever you save a new version (commit) that modifies the code of a package.
These are for backup purposes, in case the storage of the code with Squot should fail
because of a bug.

## Converting Monticello history

A converter and a verifier for the created versions is included.

```smalltalk
repository := SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git'.
packageName := 'FileSystem-Git'.
historianName := 'refs/heads/import-fsgit'.
SquotMonticelloConverter
  convertUpToLoadedVersionOfPackageNamed: packageName
  asHistorianNamed: historianName in: repository.
SquotMonticelloConverterVerifier
  verifyVersionsOf: (repository historianNamed: historianName)
  ofLoadedPackageNamed: packageName.
```

## Goodies

In case the Git Browser does not provide you with the necessary visualization 
or operations for your repository, you may want to create a button that opens
gitk or a shell at the repository.

Here is a template do-it for Windows users (requires OSProcess):
```smalltalk
OSProcess command: 'cmd /C start /D "',
  (squitRepository gitRepository repository baseDir pathString),
  '" gitk --all'.
```

[travis]: https://travis-ci.org/hpi-swa/Squot
[travis_badge]: https://travis-ci.org/hpi-swa/Squot.svg?branch=master
