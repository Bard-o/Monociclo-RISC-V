# Descripcción de hardware de Procesador Monociclo
*Un proyecto de Simón Londoño y Juan Esteban Lopez para su materia de Arquitectura de Computadores*
*Universidad Tecnológica de Pereira - 2025*

El siguiente proyecto consiste en la descripción de hardware de un procesador monociclo, el 
cual se basa en el diseño de un procesador de 32 bits, con el fin de luego implementarse en una FPGA
la cual se encargará de ejecutar las instrucciones del procesador.

![Arquitectura del procesador](/img/monociclo.png)
![Arquitectura del procesador](/img/FPGA.jpg)


El proyecto está dividido en las siguientes carpetas:

- `src`: Contiene la descripción de hardware del procesador monociclo.
- `test`: Contiene los testbenches para verificar el funcionamiento del procesador. junto con la documentación de cada modulo.
- `build`: Contiene los archivos generados durante la compilación del proyecto. (Lo normal sería ignorar estos archivos o borrarlos para tu añadir tus propias compilaciones)
- `doc`: Contiene manuales y guias sobre el tema, incluyendo la guia de pineado

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

Todos fueron diseñados en base a su funcionamiento en la base teorica que se puede encontrar en el `doc\libro_guia.pdf`

aparte de ello hay un top lebel que se encarga según todos los demás modulos en conectarlos entre ellos con el camino de texto tambien explicado en el libro guia.
*Lo unico que quedó faltando en está implementación fue el soporte para isntrucciones tipo J, la verdad se nos olvido en el desarrolló y como todo ya estpa funcional no quisimo intervenir*
*como 5 archivos para implementarla*

## Directorio test

Este directorio está dedicado a los testbenchs para cada modulo que lo requiera, en cada una de las carpetas que hay por modulo se encuentra el testbench correspondiente;
además de un archivo .md que explica que es lo que se ejecuta en este caso de prueba y porque está correcto. aparte de eso hay una archivo .vcd que se puede abrir con la extención
WaveTracer para ver las distintas señales del programa a travez del tiempo


