#include "common.h"

#ifdef COMBO_ENABLE
#define CMB(name, action, ...)                                                 \
  uint16_t const name##_combo[] PROGMEM = {__VA_ARGS__, COMBO_END};
#include "combos.def"
#undef CMB

#define CMB(name, action, ...) [name] = COMBO(name##_combo, action),
combo_t key_combos[] = {
#include "combos.def"
};
#undef CMB
#endif
