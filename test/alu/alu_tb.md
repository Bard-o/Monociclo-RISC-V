# ALU: Qué es y qué operaciones realiza

La ALU (Unidad Aritmético‑Lógica) es el bloque del procesador encargado de ejecutar operaciones matemáticas y lógicas sobre dos operandos (`a` y `b`) y producir un resultado (`alu_res`). En este proyecto, la ALU implementa las operaciones básicas del conjunto RISC‑V:

- `ADD` suma
- `SUB` resta
- `SLL` desplazamiento lógico a la izquierda
- `SRL` desplazamiento lógico a la derecha
- `SRA` desplazamiento aritmético a la derecha (con extensión de signo)
- `XOR` XOR bit a bit
- `OR` OR bit a bit
- `AND` AND bit a bit
- `SLT` menor que (comparación con signo)
- `SLTU` menor que (comparación sin signo)

## Ejemplos del testbench

Los siguientes casos corresponden a los estímulos definidos en `test/alu_tb.sv`. Para cada operación se muestran los valores en hexadecimal, su traducción a binario (32 bits) y decimal.

### 1) ADD
(res = A + B)
- `a = 0x0000000A`   → bin: `00001010` → dec: `10`
- `b = 0x00000003`   → bin: `00000011` → dec: `3`
- `res = 0x0000000D` → bin: `00001101` → dec: `13`

### 2) SUB
- `a = 0x0000000A` (dec `10`)
- `b = 0x00000003` (dec `3`)
- `res = a - b = 0x00000007` → dec: `7`

### 3) SLL (shift left lógico)
- `a = 0x00000001` → bin: `00000001` → dec: `1`
- `b = 0x00000003` → cantidad de desplazamiento `3`
- `res = a << 3 = 0x00000008` → bin: `00001000` → dec: `8`

### 4) SRL (shift right lógico)
- `a = 0x00000010` → bin: `00010000` → dec: `16`
- `b = 0x00000003` → cantidad de desplazamiento `3`
- `res = a >> 3 = 0x00000002` → bin: `00000010` → dec: `2`

### 5) SRA (shift right aritmético)
- `a = 0x80000000` → bin: `10000000 00000000 00000000 00000000` → dec (con signo): `-2147483648`
- `b = 0x0000001F` → `b[4:0] = 31`
- `res = a >>> 31 = 0xFFFFFFFF` → bin: `11111111 11111111 11111111 11111111` → dec (con signo): `-1`

Explicación: el desplazamiento aritmético preserva el bit de signo (1), por eso se llena con `1`.

### 6) XOR
- `a = 0x0000000F` → bin: `00001111` → dec: `15`
- `b = 0x000000F0` → bin: `11110000` → dec: `240`
- `res = a ^ b = 0x000000FF` → bin: `00000000 00000000 00000000 11111111` → dec: `255`

### 7) OR
- `a = 0x0000000F` (bin `00001111`)
- `b = 0x000000F0` (bin `11110000`)
- `res = a | b = 0x000000FF` → bin: `11111111` → dec: `255`

### 8) AND
- `a = 0x0000000F` (bin `...00001111`)
- `b = 0x000000F0` (bin `...11110000`)
- `res = a & b = 0x00000000` → bin: `00000000 00000000 00000000 00000000` → dec: `0`

### 9) SLT (signed less than)
- `a = 0xFFFFFFFF` → bin: `11111111 11111111 11111111 11111111` → dec con signo: `-1`
- `b = 0x00000001` → bin: `00000000 00000000 00000000 00000001` → dec con signo: `1`
- `res = (a_signed < b_signed) ? 1 : 0 = 0x00000001` → dec: `1`

### 10) SLTU (unsigned less than)
- `a = 0x00000001` → dec sin signo: `1`
- `b = 0xFFFFFFFF` → dec sin signo: `4294967295`
- `res = (a_unsigned < b_unsigned) ? 1 : 0 = 0x00000001` → dec: `1`

## Cómo ejecutar el testbench

1. asegurar que el icarus verilog esté en el path del proyecto
   - Esto se puede lograr con los siguientes comandos:
   - `$env:Path += ';C:\iverilog\bin'`
   - `$env:Path += ';C:\iverilog\gtkwave\bin'`

2. pon estos comandos en la terminal:
   - `iverilog -g2012 -o build\alu_tb.vvp src\alu.sv test\alu\alu_tb.sv`
3. Ejecuta:
   - `vvp build\alu_tb.vvp`
4. Abre el archivo de ondas:
   - `gtkwave test\alu\alu_tb.vcd`