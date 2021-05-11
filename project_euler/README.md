# Project Euler

Problems are taken from https://projecteuler.net/, the Project Euler. [Problems are licensed under CC BY-NC-SA 4.0](https://projecteuler.net/copyright).

Project Euler is a series of challenging mathematical/computer programming problems that require more than just mathematical
insights to solve. Project Euler is ideal for mathematicians who are learning to code.

## Solution Guidelines

Welcome to [TheAlgorithms/Ruby](https://github.com/TheAlgorithms/Ruby)! Before reading the solution guidelines, make sure you read the whole [Contributing Guidelines](https://github.com/TheAlgorithms/Ruby/blob/master/CONTRIBUTING.md) as it won't be repeated in here. If you have any doubt on the guidelines, please feel free to [state it clearly in an issue](https://github.com/TheAlgorithms/Ruby/issues/new) or ask the community in [Gitter](https://gitter.im/TheAlgorithms). Be sure to read the [Coding Style](https://github.com/TheAlgorithms/Ruby/blob/master/project_euler/README.md#coding-style) before starting solution.

### Coding Style

* Please maintain consistency in project directory and solution file names. Keep the following points in mind:
  * Create a new directory only for the problems which do not exist yet.
  * Please name the project **directory** as `problem_<problem_number>` where `problem_number` should be filled with 0s so as to occupy 3 digits. Example: `problem_001`, `problem_002`, `problem_067`, `problem_145`, and so on.

* You can have as many helper functions as you want but there should be one main function called `solution` which should satisfy the conditions as stated below:
  * It should contain positional argument(s) whose default value is the question input. Example: Please take a look at [Problem 1](https://projecteuler.net/problem=1) where the question is to *Find the sum of all the multiples of 3 or 5 below 1000.* In this case the main solution function will be `solution(limit = 1000)`.
  * When the `solution` function is called without any arguments like so: `solution()`, it should return the answer to the problem.
