# Program Counter (PC)

El `pc` mantiene la dirección actual de instrucción en `address` y la actualiza con `next_pc` en cada flanco de subida de `clk`. Tiene reset asíncrono activo en bajo (`rst_n`): cuando `rst_n=0`, `address` se fuerza a `0`.


- `always @(posedge clk or negedge rst_n)` `src/pc.sv:8`: actualización en flanco de subida de reloj y respuesta inmediata al reset en flanco negativo.
- `if (!rst_n) address <= 32'b0; else address <= next_pc;` `src/pc.sv:9–12`.

## ¿Qué valida el testbench?

- Inicializa `clk=0`, `rst_n=0`, `next_pc=0` y genera `pc_tb.vcd`.
- Libera el reset (`rst_n=1`) y, ciclo a ciclo, asigna `next_pc = address + 4` en el semiperiodo, observando que en el siguiente flanco de subida `address` toma ese valor.
- Reafirma el reset (`rst_n=0`) para verificar que `address` vuelve a `0` de forma asíncrona y luego reanuda con un nuevo `next_pc`.

### Secuencia esperada
- Bajo reset: `address = 0x00000000`.
- Tras liberar reset y con `next_pc = address + 4`:
  - Ciclo 1: `address = 0x00000004`
  - Ciclo 2: `address = 0x00000008`
  - Ciclo 3: `address = 0x0000000C`
  - ...
- Reset re‑aplicado: `address = 0x00000000`.
- Nueva carga: `address = 0x00000004` cuando `next_pc=4`.

## Ejecución
1. asegurar que el icarus verilog esté en el path del proyecto
   - Esto se puede lograr con los siguientes comandos:
   - `$env:Path += ';C:\iverilog\bin'`
   - `$env:Path += ';C:\iverilog\gtkwave\bin'`

2. pon estos comandos en la terminal:
   - `iverilog -g2012 -o build\pc_tb.vvp src\pc.sv test\pc\pc_tb.sv`
3. Ejecuta:
   - `vvp build\pc_tb.vvp`
4. Abre el archivo de ondas:
   - `gtkwave test\pc\pc_tb.vcd`
