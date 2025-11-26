# Branch Unit

La `branch_unit` decide si se hace un salto de linea (`branch_taken=1`) comparando `ru_X1` y `ru_X2` según el código `BrOp`.

## Códigos `BrOp`
- `BR_NOP` = `00000` (hex `0x00`): nunca toma la rama
- `BR_EQ`  = `00001` (hex `0x01`): toma si `X1 == X2`
- `BR_NE`  = `00010` (hex `0x02`): toma si `X1 != X2`
- `BR_LT`  = `00011` (hex `0x03`): toma si `X1 < X2` con signo
- `BR_GE`  = `00100` (hex `0x04`): toma si `X1 >= X2` con signo
- `BR_LTU` = `00101` (hex `0x05`): toma si `X1 < X2` sin signo
- `BR_GEU` = `00110` (hex `0x06`): toma si `X1 >= X2` sin signo

## Qué prueba el testbench

1) Igualdad
- `X1=0x0000000A` → bin `000...01010` (dec `10`)
- `X2=0x0000000A` → bin `000...01010` (dec `10`)
- `BrOp=BR_EQ` → `branch_taken=1` porque son iguales.

2) No igualdad
- `X1=0x0000000A` (dec `10`), `X2=0x0000000B` (dec `11`)
- `BrOp=BR_EQ` → `branch_taken=0` (no iguales)
- `BrOp=BR_NE` → `branch_taken=1` (distintos)

3) Comparación con signo
- `X1=0xFFFFFFFF` → bin `111...111` (dec con signo `-1`)
- `X2=0x00000001` → bin `000...001` (dec con signo `1`)
- `BrOp=BR_LT` → `branch_taken=1` porque `-1 < 1`.
- `BrOp=BR_GE` → `branch_taken=0` porque `-1` no es `>= 1`.

4) Comparación sin signo
- `X1=0x00000001` → dec sin signo `1`
- `X2=0xFFFFFFFF` → dec sin signo `4294967295`
- `BrOp=BR_LTU` → `branch_taken=1` porque `1 < 4294967295`.

- `X1=0xFFFFFFFF` → dec sin signo `4294967295`
- `X2=0x00000001` → dec sin signo `1`
- `BrOp=BR_GEU` → `branch_taken=1` porque `4294967295 >= 1`.

## Cómo ejecutar el testbench

1. asegurar que el icarus verilog esté en el path del proyecto
   - Esto se puede lograr con los siguientes comandos:
   - `$env:Path += ';C:\iverilog\bin'`
   - `$env:Path += ';C:\iverilog\gtkwave\bin'`

2. pon estos comandos en la terminal:
   - `iverilog -g2012 -o build\branch_unit_tb.vvp src\branch_unit.sv test\branch_unit\branch_unit_tb.sv`
3. Ejecuta:
   - `vvp build\branch_unit_tb.vvp`
4. Abre el archivo de ondas:
   - `gtkwave test\branch_unit\branch_unit_tb.vcd`
