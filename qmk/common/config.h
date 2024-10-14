#pragma once
//#define QUICK_TAP_TERM 0
#define TAPPING_TERM 150
#define COMBO_TERM 20
#define COMBO_MUST_HOLD_MODS
#define COMBO_HOLD_TERM 25
// #define FORCE_NKRO
#define BOTH_SHIFTS_TURNS_ON_CAPS_WORD

#define TRI_LAYER_LOWER_LAYER 1 // extension layer
#define TRI_LAYER_UPPER_LAYER 2 // symbol layer
#define TRI_LAYER_ADJUST_LAYER 5 // media layer
#define COMBO_ONLY_FROM_LAYER 0 // define combos in relation to base layer, to achieve layer-independent combos
#define TAPPING_TOGGLE 1 // tap-toggle keys must be pressed one time to do tap action

#ifdef SPLIT_KEYBOARD
#define MASTER_RIGHT // handedness
#endif
