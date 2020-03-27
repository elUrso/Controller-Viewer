# Standard

## What is it?

Standard is set of functionality designed to extend lua out-of-the-box features.

## __tostring values

Standard use a collection of __tostring values help users understand what those values are.

Every Standard related value have a <std> prefix in its __tostring value.

The type of Standard values are the following:
 - function
 	Values are standard functions.
 - built-in
 	Values are used like functions, but the are used to create datatypes.
	Usually the function itself is defined using __call from their metatable.
 - class
 	Classes have subclass capabilities and in the future will have protocol habilities.
 - protocol
 	Defines a set of expected behavior from classes. Protocols are used to garantee that objects have the correct behaviour.
