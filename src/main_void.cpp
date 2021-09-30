#include "hardware.h"
#include <void/interrupt.h>
#include <void/delay.h>

int main() {
	vd::EnableInterrupts();
	for (uint8_t i = 0; i < 100; ++i) {
		vd::delay(1_s);
	}

	return 0;
}
