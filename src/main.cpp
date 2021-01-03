#include "hardware.h"
#include <util/delay.h>
int main() {
	while (true){
		_delay_ms(1000);
		for (uint8_t i = 0; i < 100; ++i) {}
	}
}
