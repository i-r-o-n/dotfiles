#pragma once
#include QMK_KEYBOARD_H

enum custom_keycodes {
  ALT_TAB = SAFE_RANGE,
  DBPRN, // double parenthesis with arrow back
  DBBRC, // double brackets
  DBCBR, // double curly brackets
  DBABK  // double angled brackets
};

extern bool is_alt_tab_active;
extern uint16_t alt_tab_timer;

bool process_record_user(uint16_t keycode, keyrecord_t *record);
void matrix_scan_user(void);