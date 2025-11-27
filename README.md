# Descripcción de hardware de Procesador Monociclo
*Un proyecto de Simón Londoño y Juan Esteban Lopez para su materia de Arquitectura de Computadores*
*Universidad Tecnológica de Pereira - 2025*

El siguiente proyecto consiste en la descripción de hardware de un procesador monociclo, el cual se basa en el diseño de un procesador de 32 bits, con el fin de luego implementarse en una FPGA la cual se encargará de ejecutar las instrucciones del procesador.

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
además de un archivo .md que explica que es lo que se ejecuta en este caso de prueba y porque está correcto. aparte de eso hay una archivo .vcd que se puede abrir con la extención WaveTracer para ver las distintas señales del programa a travez del tiempo

## Directorio Doc

Contiene el libro guía *Arquitectura de Computadoras con RISC-V* en el que encontrarás la definición de cada instrucción, así como la descripción de la arquitectura del procesador, la memoria y los registros.

Aparte también tiene el manual de la FPGA que usé en este caso, ahi encontrarás el pineado de todos las señales posibles y también como funcionan los protocolos de entrada y salida, para luego hacer un sieño con VGA esta guia te puede servir.

Como ultimo (y para ahorrarte comprovar la guia) está la guia de pines para este top_level especifico, aparte ahi encontrarás **Como afecta cada switch y botón especifico para las salidas del sistema**, te servirá para cuando cargues tus instrucciones especificas (en hexadecimal) al `instruction_memory.sv` puedas cargar el programa y verificar como funciona todo

    Aunque un resumen rápido de lo que hacen cada uno es:
    - Switches:
        - Switches 0 y 1: hacen que los display muestren distintas partes de la instrución en hex
        - Switch 2 muestra el inmediado de la instrucción
        - Switch 3 muestra resultado de la ALU
        - Switch 4 muestra la las lecturas de Data memory
    - Botones:
        - Botón 0: Carga el programa en la memoria de instrucciones.
        - Botón 1: Habilita la ejecución del programa.
    - LEDs:
        - led[4:0]: mostrará el ALUOp de la instrucción actual
        - led[7:5]: mostrará el tipo de descontrucción que tenga el inmediato en la instrucción actual
        - led[8]:   mostrará si la ALU está operando con un registro o si está operando 2 registros
        - led[9]:   mostrará si es está escribiendo en rd

para mayor información del porque se muestran estos datos puedes ver el `top_level.sv` y saber leer un poco



