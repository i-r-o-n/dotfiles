#include "common.h"

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case DDPI_T: // scrolling toggle
      if (record->event.pressed) {
        charybdis_cycle_pointer_default_dpi_noeeprom(true);
      }
      break;
    case SDPI_T: // sniper/low dpi toggle
      if (record->event.pressed) {
        charybdis_cycle_pointer_sniping_dpi_noeeprom(true);
      }
      break;
  return true;
};

// auto mouse management
void pointing_device_init_user(void) {
    set_auto_mouse_enable(true);
}

// fix sticky scroll?
// called right before layer changes                v state about to be applied
layer_state_t layer_state_set_user(layer_state_t state) {
    if (get_highest_layer(state) != _POINTER) {
        charybdis_set_pointer_sniping_enabled(false);
        charybdis_set_pointer_dragscroll_enabled(false);
    }
    return state; // don't change state
}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_BASE] = LAYOUT(___BASE___),
  [_EXTENSION] = LAYOUT(
  // ╭─────────────────────────────────────────────╮ ╭─────────────────────────────────────────────╮
        KC_ESC, KC_LGUI, PREVTAB, NEXTTAB,    NONE,       NONE, KC_HOME,   KC_END,    NONE,   NONE,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
           OSG,     OSA,     OSS,     OSC,    NONE,    KC_LEFT, KC_DOWN,    KC_UP, KC_RGHT, KC_TAB,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
       C(KC_Z), C(KC_X), C(KC_C), C(KC_V),    NONE,       NONE, KC_BSPC,C(KC_BSPC), KC_DEL,   NONE,
  // ╰─────────────────────────────────────────────┤ ├─────────────────────────────────────────────╯
                         _______, _______, _______,  S(KC_ENT), _______
  //                   ╰───────────────────────────╯ ╰──────────────────╯
  ),

  [_SYMBOL] = LAYOUT(
  // ╭─────────────────────────────────────────────╮ ╭─────────────────────────────────────────────╮
       KC_LABK, KC_RABK, KC_LCBR, KC_RCBR,    NONE,     KC_GRV, KC_CIRC,   KC_DLR, KC_QUES, KC_EXLM,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
       KC_BSLS, KC_SLSH, KC_LPRN, KC_RPRN,    NONE,    KC_TILD, KC_UNDS,   KC_EQL, KC_MINS, KC_PLUS,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
          NONE, KC_PIPE, KC_LBRC, KC_RBRC,    NONE,    KC_PERC, KC_HASH,  KC_AMPR, KC_ASTR, KC_AT, 
  // ╰─────────────────────────────────────────────┤ ├─────────────────────────────────────────────╯
                         _______, _______, _______,    _______, _______
  //                   ╰───────────────────────────╯ ╰──────────────────╯
  ),
  [_NUMBER] = LAYOUT(___NUMBER___),
  [_FUNCTION] = LAYOUT(___FUNCTION___),
  [_MEDIA] = LAYOUT(
  // ╭─────────────────────────────────────────────╮ ╭─────────────────────────────────────────────╮
       NONE,    NONE,    NONE,    NONE,       NONE,       NONE,    NONE,    NONE,    NONE,    NONE,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
       KC_MSTP, KC_MPRV, KC_MNXT, KC_MPLY,    NONE,       NONE,    NONE,    NONE,    NONE,    NONE,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
       NONE,    KC_MUTE, KC_VOLD, KC_VOLU,    NONE,       NONE,    NONE,    NONE,    NONE,    NONE,
  // ╰─────────────────────────────────────────────┤ ├─────────────────────────────────────────────╯
                         _______, _______, _______,    _______, _______
  //                   ╰───────────────────────────╯ ╰──────────────────╯
  ),

  [_POINTER] = LAYOUT(
  // ╭─────────────────────────────────────────────╮ ╭─────────────────────────────────────────────╮
          NONE,    NONE,    NONE,    NONE,    NONE,       NONE,    NONE,    NONE,    NONE,    NONE,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
          NONE,    NONE, KC_LSFT, KC_LCTL,    NONE,       NONE, KC_BTN1, KC_BTN2, KC_BTN3,    NONE,
  // ├─────────────────────────────────────────────┤ ├─────────────────────────────────────────────┤
       C(KC_Z), C(KC_X), C(KC_C), C(KC_V),    NONE,       NONE,KC_BSPC,C(KC_BSPC), KC_DEL,    NONE,
  // ╰─────────────────────────────────────────────┤ ├─────────────────────────────────────────────╯
                         _______, DRGSCRL, SNIPING,       NONE,    NONE
  //                   ╰───────────────────────────╯ ╰──────────────────╯
  )
};
