Feature: Build nodejs dependant modules during build step
  As a lambda function I may use third party modules to execute my business logic.
  Those modules have to be installed before I'm executed or I will fail to execute.

  Background:
    Given lambda is a node function