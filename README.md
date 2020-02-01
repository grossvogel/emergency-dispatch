# Things that need to happen in the game loop
- [X] update the total elapsed time
- decide if any new events need to happen
  - likelihood should depend on existing # of events, difficulty level, etc
  - logic to determine where, severity, duration
  - is there already an event there?
- visit each existing event
  - update timer
  - see if in-progress work is finished
  - decide if any events have failed to be resolved in time
- decide if the game has been won or lost

