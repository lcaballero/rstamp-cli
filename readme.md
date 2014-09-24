# Introduction [![Build Status](https://travis-ci.org/lcaballero/rstamp-cli.svg?branch=master)](https://travis-ci.org/)

`rstamp-cli` is a Node.js command line tool that runs `rstamp-generators`.


## Installation

Because `rstamp-cli` is a command-line interface it needs to be installed globally.

`%> npm install rstamp-cli -g`

By itself `rstamp-cli` doesn't really provide any useful tools.  So, to be useful
other `rstamp-generators` should also be installed.  At the moment (9/23/2014)
there are only a few npm packages for use with rstamp.

See these npm packages and how to install them.  Typically these packages can be
installed globally via `npm rstamp-generator -g`.  However, you could also
clone these generators to a directory of your choice and then run
`%> npm link` inside that cloned directory.

The generator [express-train-1][express-train-1] project,
generates a Node Express, Handlebars, Angular, Nject, and Express-Train combination.

The [gen-gen][gen-gen] generator generates a new rstamp generator.  That's a lot of
words based on generate.

The [new-npm][new-npm] generator will create a new npm package directory with the basics,
for instance, a src/ tests/ directory, and license, package.json, .travis.yml files.


## Usage

The command-line tool has the following interface:

```
  Usage: rstamp [option] <template-name> <args...>

  Options:

    -h, --help      output usage information
    -V, --version   output the version number
    -l, --list      List the available 'rstamp' templates.
    -i, --internal  List the dirs/ and variables used internally by rstamp.
    -g, --generate  Generate the project provided as argument to rstamp.

```

Running `%> rstamp --list` will show the list of templates on the system and their
descriptions.  The example below shows the few templates available as of (9/23/2014).


```
---------------------------------------------------------------------

Local 'rstamp' templates. Run with:

   %> rstamp -g template-name

----------------------------------------------------------------------

express-train-1

   Generates an Express Web App that uses Handlebars for the view
   engine and AngularJS for the front end framework.

gen-gen

   A rstamp template that generates a generator project.

new-npm

   A rstamp template that generates a new npm package with some basic
   defaults development dependencies.


```


## License

See license file.

The use and distribution terms for this software are covered by the
[Eclipse Public License 1.0][EPL-1], which can be found in the file 'license' at the
root of this distribution. By using this software in any fashion, you are
agreeing to be bound by the terms of this license. You must not remove this
notice, or any other, from this software.


[EPL-1]: http://opensource.org/licenses/eclipse-1.0.txt
[express-train-1]: https://github.com/lcaballero/rstamp-express-train-1
[gen-gen]: https://github.com/lcaballero/gen-gen
[new-npm]: https://github.com/lcaballero/new-npm
