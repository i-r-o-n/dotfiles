| Flag | Meaning                                                                                        |
| ---- | ---------------------------------------------------------------------------------------------- |
| i    | Snippet can be triggered in the middle of a word.                                              |
| w    | Snippet can only be triggered at the beginning of a word.                                      |
| b    | Snippet can only be triggered at the beginning of a line or after whitespace.                  |
| A    | Snippet will auto-trigger as soon as the trigger is typed, without needing a tab or other key. |
| r    | The trigger of the snippet is interpreted as a regular expression.                             |
| t    | The content of the snippet will be treated as plain text, not as vimscript code.               |
| m    | The snippet definition may contain mirror transformations.                                     |
| e    | The snippet definition may contain python code.                                                |
| s    | Snippet will be expanded automatically when the trigger is followed by a 'tab' character.      |
| n    | Prevent UltiSnips from jumping to the next placeholder after expansion.                        |
