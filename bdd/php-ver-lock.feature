Feature: Enforce lambda specifying specific version of PHP
  As a service, to reduce unknown issues I require the lambda function to specify which version of PHP to use.

  Background:
    Given lambda function has some kind of config that says what version of php to use.