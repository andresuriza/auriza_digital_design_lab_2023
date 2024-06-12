    mov r0, #0x000000f0      // Inicializa r0 con la dirección de inicio
    mov r5, #0               // Inicializa r5 con 0 para contar las vocales
    mov r6, r0               // Guarda la dirección inicial de la palabra en r6
    ldr r7, =0x20            // Carga el valor de espacio (0xAA) en r7
    ldr r8, [r9, #0x000000e0] // Carga el valor de comparación desde la dirección 0x000000e0 en r8
    ldr r10, =0x00000b50     // Dirección final
    ldr r4, =0x000000e4      // Dirección del valor que determina el inicio del análisis

espera:
    ldr r3, [r4]             // Carga el valor en la dirección e4 en r3
    cmp r3, #1               // Compara r3 con 1
    bne espera               // Si r3 no es 1, vuelve a esperar

    // Inicio del análisis
bucle:
    ldrb r1, [r0]            // Carga el byte en la dirección apuntada por r0 en r1
    cmp r1, #0x61            // Compara r1 con 'a'
    beq vocal
    cmp r1, #0x65            // Compara r1 con 'e'
    beq vocal
    cmp r1, #0x69            // Compara r1 con 'i'
    beq vocal
    cmp r1, #0x6F            // Compara r1 con 'o'
    beq vocal
    cmp r1, #0x75            // Compara r1 con 'u'
    beq vocal
    cmp r1, r7               // Compara r1 con espacio (0xAA)
    beq palabra_nueva
    b next                   // Si no es una vocal ni espacio, pasa a la siguiente dirección

vocal:
    add r5, r5, #1           // Si es una vocal, incrementa el contador en r5
    b next

palabra_nueva:
    cmp r5, r8               // Compara el contador de vocales con el valor en r8
    bne reset_contador       // Si no es igual, resetea el contador y sigue
    mov r0, r6               // Si es igual, regresa al inicio de la palabra en r0
reemplazo:
    ldrb r1, [r0]            // Carga el byte en la dirección apuntada por r0 en r1
    cmp r1, r7               // Compara r1 con espacio (0xAA)
    beq reset_contador       // Si es un espacio, reinicia el contador y continua
    cmp r1, #0x61            // Compara r1 con 'a'
    beq escribir_dolar
    cmp r1, #0x65            // Compara r1 con 'e'
    beq escribir_dolar
    cmp r1, #0x69            // Compara r1 con 'i'
    beq escribir_dolar
    cmp r1, #0x6F            // Compara r1 con 'o'
    beq escribir_dolar
    cmp r1, #0x75            // Compara r1 con 'u'
    beq escribir_dolar
    b incrementar_direccion

escribir_dolar:
    mov r2, #0x24            // Carga el carácter '$' en r2
    strb r2, [r0]            // Escribe el '$' en la dirección de r0

incrementar_direccion:
    add r0, r0, #4           // Incrementa la dirección en r0 en 1 (un byte)
    cmp r0, r10              // Compara r0 con la dirección final
    ble reemplazo            // Si r0 es menor o igual que la dirección final, vuelve a intentar reemplazar

reset_contador:
    mov r5, #0               // Resetea el contador de vocales
    add r0, r0, #4           // Incrementa la dirección en r0 en 4 (4 bytes)
    mov r6, r0               // Guarda la nueva posición inicial de la palabra en r6
    cmp r0, r10              // Compara r0 con la dirección final
    blt bucle                // Si r0 es menor que la dirección final, vuelve al inicio del bucle

next:
    add r0, r0, #4           // Incrementa la dirección en r0 en 4 (4 bytes)
    cmp r0, r10              // Compara r0 con la dirección final
    blt bucle                // Si r0 es menor que la dirección final, vuelve al inicio del bucle

end:
