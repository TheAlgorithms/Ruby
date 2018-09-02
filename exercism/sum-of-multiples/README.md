# Sum Of Multiples

Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are
multiples of either 3 or 5, we get 3, 5, 6 and 9, 10, 12, 15, and 18.

The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of
numbers.

This exercise is currently under revision.
You are still free to do this exercise and submit solutions.
Depending on whether this track has been updated recently,
the tests may differ between this track and other tracks.

In most tracks, the set of numbers must be explicitly provided.
In some other tracks, if no set of numbers is given, it defaults to 3 and 5.
We would like all tracks to require the set of numbers be explicit.

If you would like to help out, please join us at
https://github.com/exercism/x-common/issues/198.

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -rminitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb

## Source

A variation on Problem 1 at Project Euler [http://projecteuler.net/problem=1](http://projecteuler.net/problem=1)
