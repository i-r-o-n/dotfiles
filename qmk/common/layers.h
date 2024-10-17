// Copyright 2024 jack@pngu.org
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once
#include QMK_KEYBOARD_H

enum custom_layers {
    _BASE,
    // _VIM,
    _EXTENSION,
    _SYMBOL,
    _NUMBER,
    _FUNCTION,
    _MEDIA,
    _POINTER
};

// enum layers { _BASE, _LOWER, _RAISE };
// enum custom_keycodes {};


/* 
void td_reset(tap_dance_state_t *state, void *user_data);
void em_dash_mins(tap_dance_state_t *state, void *user_data);
void ply_nxt_prv(tap_dance_state_t *state, void *user_data);
void raise_paste(tap_dance_state_t *state, void *user_data);
*/

// one shot mod aliases
#define OSC OSM(MOD_LCTL)
#define OSS OSM(MOD_LSFT)
#define OSG OSM(MOD_LGUI)
#define OSA OSM(MOD_LALT)

// home row mods
#define GUI_S GUI_T(KC_S)
#define ALT_R ALT_T(KC_R)
#define SFT_N SFT_T(KC_N)
#define CTR_T CTL_T(KC_T)

// hold layer aliases
// #define L_SEMI TO(0)
// #define L_VIM TO(1)
#define L_POINT MO(6)
#define L_FUNC MO(4)
#define L_NUM MO(3)

#define NEXTTAB C(KC_TAB)
#define PREVTAB C(S(KC_TAB))

#define NONE XXXXXXX
#define TRNS _______
#define NONE5 NONE,NONE,NONE,NONE,NONE
#define TRNS5 TRNS,TRNS,TRNS,TRNS,TRNS

// home row left, right
#define HRML(k1, k2, k3, k4) LGUI_T(k1), LALT_T(k2), LSFT_T(k3), LCTL_T(k4)
#define HRMR(k1, k2, k3, k4) RCTL_T(k1), RSFT_T(k2), RALT_T(k3), RGUI_T(k4)

// clang-format off
#define __BASE1__ KC_F, KC_L, KC_H, KC_V, KC_Z, KC_QUOT, KC_W, KC_U, KC_O, KC_Y,
#define __BASE2__ HRML(KC_S, KC_R, KC_N, KC_T), KC_K, KC_C, KC_D, KC_E, KC_A, KC_I
#define __BASE3__ KC_X, KC_J, KC_B, KC_M, KC_Q, KC_P, KC_G, KC_COMM, KC_DOT, KC_SCLN,
#define __BASE4__ L_POINT, TL_LOWR, KC_SPC, KC_ENT, TL_UPPR
#define ___BASE___  SE__ __BASE1__, __BASE2__, __BASE3__, __BASE4__

#define __NUMBER1__ NONE5,NONE, KC_7, KC_8, KC_9, KC_DOT,
#define __NUMBER2__ NONE5,NONE, KC_4, KC_5, KC_6, KC_ENT,
#define __NUMBER3__ NONE5,NONE, KC_1, KC_2, KC_3, KC_BSPC,
#define __NUMBER4__ TRNS,TRNS,TRNS,L_FUNC, KC_0 
#define ___NUMBER___ __NUMBER1__, __NUMBER2__, __NUMBER3__, __NUMBER4__,

#define __FUNCTION1__ NONE5,NONE, KC_F7, KC_F8, KC_F9, KC_F12,
#define __FUNCTION2__ NONE5,NONE, KC_F4, KC_F5, KC_F6, KC_F11,
#define __FUNCTION3__ NONE5,NONE, KC_F1, KC_F2, KC_F3, KC_F10,
#define __FUNCTION4__ NONE,NONE,NONE,TRNS,NONE
#define ___FUNCTION___ __FUNCTION1__, __FUNCTION2__, __FUNCTION3__, __FUNCTION4__

#define __SYMBOL1__ KC_LABK, KC_RABK, KC_LCBR, KC_RCBR, NONE, KC_GRV,  KC_CIRC,   KC_DLR, KC_QUES, KC_EXLM,
#define __SYMBOL2__ KC_BSLS, KC_SLSH, KC_LPRN, KC_RPRN, NONE, KC_TILD, KC_UNDS,   KC_EQL, KC_MINS, KC_PLUS,
#define __SYMBOL3__ NONE,    KC_PIPE, KC_LBRC, KC_RBRC, NONE, KC_PERC, KC_HASH,  KC_AMPR, KC_ASTR, KC_AT, 
#define ___SYMBOL___ __SYMBOL1__, __SYMBOL2__, __SYMBOL3__, TRNS5 

#define __MEDIA1__ NONE5, NONE5 
#define __MEDIA2__ KC_MSTP, KC_MPRV, KC_MNXT, KC_MPLY, NONE, NONE5
#define __MEDIA3__ NONE,    KC_MUTE, KC_VOLD, KC_VOLU, NONE, NONE5
#define ___MEDIA___ __MEDIA1__, __MEDIA2__, __MEDIA3__, TRNS5 
// clang-format on


#define LAYOUT_common(...) LAYOUT(__VA_ARGS__)
