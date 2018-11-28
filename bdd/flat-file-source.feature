Feature: Support receiving events from a flat file source
  As a service, I want to pop events from a flat file with each event on a new line.
  This will be used for unit testing lambda functions as well as small edge cases that include slower hardware with fewer resources (possibly IOT).
  Each event would get it's own dedicated file.