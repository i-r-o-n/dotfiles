# info

## nodes

Core Node Functions

t (text_node):

Creates static, non-editable text within a snippet
Example: t("hello") inserts the literal text "hello" in your snippet

i (insert_node):

Creates an editable placeholder where the cursor will stop
Takes a position number and optional default text
Example: i(1, "default") creates the first tabstop with "default" as placeholder text

f (function_node):

Executes a function to generate dynamic content
Example: f(function(args) return string.upper(args\[1]\[1]) end, {1}) would uppercase text from node 1

c (choice_node):

Presents multiple options that you can cycle through
Example: c(1, {t("option1"), t("option2")}) lets you choose between two options

d (dynamic_node):

Similar to function_node but returns a snippet_node
Often used for transforming visual selections
Example: Your get_visual function is used with d nodes

sn (snippet_node):

Creates a snippet within another snippet (nested snippets)
Example: Used in your get_visual function to wrap the selection

r (restore_node):

Remembers content across snippet updates

## flags

regTrig (boolean): When set to true, treats the trigger as a Lua pattern instead of literal text. This enables regex-like matching.

wordTrig (boolean): When set to true (default), the snippet will only trigger if the word boundary condition is met (the character before the trigger is not a letter).

snippetType (string): Can be:

"snippet" (default): Regular snippet that expands when triggered
"autosnippet": Automatically expands when typed without needing to press the expand key

priority (number): Determines which snippet to expand when multiple snippets have the same trigger (higher value = higher priority).

condition (function): A function that returns true/false to determine if the snippet should be available in the current context.

show_condition (function): Similar to condition but controls whether the snippet shows up in completion menus.

hidden (boolean): When true, hides the snippet from completion menus.

docstring (string): Documentation for the snippet shown in completion menus.

resolveExpandParams (function): Advanced function to modify expansion parameters.

stored (boolean or string): Controls how the snippet is stored for jumping back to it.

name (string): A descriptive name for the snippet (useful for debugging and UI).

description (string): Additional description shown in some UIs.

docTrig (string): An alternative trigger string to display in documentation.

trigEngine (table): For using a custom trigger engine rather than the default.
