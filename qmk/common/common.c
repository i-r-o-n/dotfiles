#include "combos.h"
#include "layers.h"


/* #ifdef POINTING_DEVICE_ENABLE */
/* static bool scrolling = false; */
/* layer_state_t layer_state_set_user(layer_state_t state) { */
/*   switch (get_highest_layer(state)) { */
/*   case _LOWER: */
/*     scrolling = true; */
/* #ifdef POINTING_DEVICE_DRIVER_pimoroni_trackball */
/*     pimoroni_trackball_set_cpi(0.1); */
/* #else */
/*     pointing_device_set_cpi(64); */
/* #endif */
/*     break; */
/*   default: */
/*     if (scrolling) { */
/*       scrolling = false; */
/* #ifdef POINTING_DEVICE_DRIVER_pimoroni_trackball */
/*       pimoroni_trackball_set_cpi(1); */
/* #else */
/*       pointing_device_set_cpi(1024); */
/* #endif */
/*     } */
/*   } */
/*   return state; */
/* } */
/**/
/* report_mouse_t pointing_device_task_user(report_mouse_t mouse_report) { */
/*   if (scrolling) { */
/*     mouse_report.h = mouse_report.x; */
/*     mouse_report.v = -mouse_report.y; */
/*     mouse_report.x = 0; */
/*     mouse_report.y = 0; */
/*   } */
/*   return mouse_report; */
/* } */
/* #endif */
