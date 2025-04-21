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
