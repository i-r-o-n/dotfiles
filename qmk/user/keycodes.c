#include QMK_KEYBOARD_H
#include <stdio.h>

enum custom_keycodes {
  ALT_TAB = SAFE_RANGE,
  DBPRN, // double parenthesis with arrow back
  DBBRC, // double brackets
  DBCBR, // double curly brackets
  DBABK  // double angled brackets
};

bool is_alt_tab_active = false;
uint16_t alt_tab_timer = 0;

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case DBPRN:
      if (record->event.pressed) {
        tap_code16(KC_LPRN);
        tap_code16(KC_RPRN);
      } else {
        tap_code(KC_LEFT);
      }
      break;

    case DBBRC:
      if (record->event.pressed) {
        tap_code16(KC_LBRC);
        tap_code16(KC_RBRC);
      } else {
        tap_code(KC_LEFT);
      }
      break;

    case DBCBR:
      if (record->event.pressed) {
        tap_code16(KC_LCBR);
        tap_code16(KC_RCBR);
      } else {
        tap_code(KC_LEFT);
      }
      break;

    case DBABK:
      if (record->event.pressed) {
        tap_code16(KC_LABK);
        tap_code16(KC_RABK);
      } else {
        tap_code(KC_LEFT);
      }
      break;

    case ALT_TAB:
      if (record->event.pressed) {
        if (!is_alt_tab_active) {
          is_alt_tab_active = true;
          register_code(KC_LALT);
        }
        alt_tab_timer = timer_read();
        register_code(KC_TAB);
      } else {
        unregister_code(KC_TAB);
      }
      break;
  }
  return true;
};

void matrix_scan_user(void) {
  if (is_alt_tab_active) {
    if (timer_elapsed(alt_tab_timer) > 1000) {
      unregister_code(KC_LALT);
      is_alt_tab_active = false;
    }
  }
};