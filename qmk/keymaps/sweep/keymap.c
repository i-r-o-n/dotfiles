// qmk flash -c -kb ferris/sweep -km iron -e CONVERT_TO=blok -bl uf2-split-<left|right>

/* #include "layers.h" */
/* #include "combos.h" */
#include "user.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_BASE] = ___BASE___,
  [_EXTENSION] = ___EXTENSION___,
  [_SYMBOL] = ___SYMBOL___,
  [_NUMBER] = ___NUMBER___,
  [_FUNCTION] = ___FUNCTION___,
  [_MEDIA] = ___MEDIA___
  /*
    //mouse
  [_POINTER] = LAYOUT(
  //,--------------------------------------------.                    ,--------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_BTN1, KC_MS_U, KC_BTN2, KC_WH_U,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_D,
  //|--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_WH_L, KC_WH_R, C(KC_V), C(KC_C),
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX,    _______, _______
                                      //`-----------------'  `-----------------'
  ),
  */
};
