# levents

Basic events library like node.js EventEmitter class.

Feel free to open issues with suggestions or actual bugs. Also feel free to open pull requests.

# Documentation

This module exports a function, which creates a new event emitter. The returned event emitter has some methods, which are described below.

## `on(name, listener)` method

Assigns a listener function `listener` to be executed when the event `name` is emitted.<br>
The return value is the listener function.

## `once(name, listener)` method

Assigns a listener function `listener` to be executed only on the next time the event `name` is emitted. The listener function is only executed once.<br>
The return value is the listener function.

## `off(name, listener)` method

Removes a listener function `listener` previously assigned to be executed when the event `name` is emitted.<br>
If the same listener function is assigned multiple times, this method only removes one of them.<br>
Returns `true` if the function was removed from that event, or `false` if there was no such listener function assigned to that event.

## `isactive(name)` method

Returns `true` if the event `name` is active (if the event calls the listener functions when emitted), or `false` otherwise.<br>
By default, all events are active.

## `deactivate(name)` method

Deactivates the event `name`. Returns `nil`.

## `activate(name)` method

Activates the event `name`. Returns `nil`.

## `clear(name)` method

Deletes (or clears) the `event` name, along with all its listeners. Returns `nil`.

## `emit(name, ...)` method

Emits the event `name`. In other words, all its listeners are called, and any extra arguments to this method are passed to those listeners.