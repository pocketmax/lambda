Feature: Get latest event to process
  As a lambda function who needs data to process
  I want to be passed the latest event so I can process it

  Acceptance Criteria
    - I will only be called with an event to process

# This Scenario tests edge cases through separate steps
Background:
  Given I have already been built into container

Scenario: executing lambda function
  Given an event has already been selected to be passed to lambda
  When the lambda is executed
  Then exit successfully