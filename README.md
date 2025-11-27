# Descripcción de hardware de Procesador Monociclo

El siguiente proyecto consiste en la descripción de hardware de un procesador monociclo, el 
cual se basa en el diseño de un procesador de 32 bits, con el fin de luego implementarse en una FPGA
la cual se encargará de ejecutar las instrucciones del procesador.

El proyecto está dividido en las siguientes carpetas:

- `src`: Contiene la descripción de hardware del procesador monociclo.
- `test`: Contiene los testbenches para verificar el funcionamiento del procesador. junto con la documentación de cada modulo.
- `build`: Contiene los archivos generados durante la compilación del proyecto. (Lo normal sería ignorar estos archivos o borrarlos para tu añadir tus propias compilaciones)
- `doc`: Contiene manuales y guias sobre el tema

No voy a comentar en este README el funcionamiento de cada modulo, ya que cada modulo se encuentra documentado en la carpeta `test`.

## Directorio src

Contiene los siguientes archivos de sistem verilog

    - alu.sv: Unidad aritmético lógica.
    - branch.sv: Branch unit.
    - control.sv: Control unit.
    - data_mem.sv: Data memory.
    - genInm.sv: Generador de inmediatos.
    - hex7seg.sv: Decodificador de 7 segmentos.
    - instruction_memory.sv: Instruction memory.
    - pc.sv: Program counter.
    - register_unit.sv: Register unit.
    - top_level.sv: Top level module.

Todos fueron diseñados en base a su funcionamiento en la base teorica 
