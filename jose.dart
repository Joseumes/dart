void main() {
  // Variables con tipo explícito.
  String nombreCliente = 'Ana Lopez';
  String tipoCliente = 'estudiante';
  int numeroFactura = 1001;
  bool compraFinalizada = false;

  // Null safety.
  String? correo;
  String? cupon = 'UMES10';

  // Constante.
  const double porcentajeIva = 0.12;

  // Final: se asigna una sola vez en tiempo de ejecución.
  final DateTime fechaCompra = DateTime.now();

  // Inferencia de tipo.
  var nombreTienda = 'Tienda Universitaria UMES';

  // Dynamic: puede cambiar de tipo.
  dynamic referenciaPago = 'PENDIENTE';

  final productos = <Map<String, dynamic>>[
    {
      'nombre': 'Cuaderno',
      'categoria': 'Papeleria',
      'precio': 25.0,
      'cantidad': 3,
    },
    {
      'nombre': 'Memoria USB',
      'categoria': 'Tecnologia',
      'precio': 85.0,
      'cantidad': 1,
    },
    {
      'nombre': 'Libro de Dart',
      'categoria': 'Libros',
      'precio': 120.0,
      'cantidad': 2,
    },
  ];

  const cupones = <String, double>{
    'UMES10': 0.10,
    'LIBRO5': 0.05,
    'DOCENTE15': 0.15,
  };
  // TODO 1: mostrar los productos.
  mostrarProductos(productos);

  for (var producto1 in productos) {
    String nombre = producto1['nombre'];
    String categoria = producto1['categoria'];
    double precio = producto1['precio'];
    int cantidad = producto1['cantidad'];

    print('$nombre - $categoria - $precio - $cantidad');
  }

  // TODO 2: calcular el subtotal.
  double subtotal = calcularSubtotal(productos);
  double total1 = 0;
  for (var producto1 in productos) {
    double multiplicar = producto1['precio'] * producto1['cantidad'];

    total1 = total1 + multiplicar;
  }
  print('Subtotal $total1');

  // TODO 3: obtener el descuento según el tipo de cliente.

  double descuento1 = 0.0;
  switch (tipoCliente) {
    case 'estudiante':
      descuento1 = 0.10; 
      break;
    case 'docente':
      descuento1 = 0.15; 
      break;
    case 'visitante':
      descuento1 = 0.0;
      break;
    default:
      descuento1 = 0.0;
      break;
  }
  print('total del descuento $descuento1');

  double descuentoCliente = obtenerDescuentoCliente(tipoCliente);

  // TODO 4: obtener el descuento del cupón aplicando null safety.
  // Se usa el operador de aserción nula (!) o verificación si no es nulo.

  double descuentoCupon = (cupon != null && cupones.containsKey(cupon))
      ? cupones[cupon]!
      : 0.0;  
  print("Descuento Cupon $descuentoCupon");
  
  
  double descuentoCupon1= 0;
  if (cupon != null){
    if (cupones.containsKey(cupon)){
      descuentoCupon1=cupones[cupon]?? 0;
    }
  }
 
    print("Descuento Cupon $descuentoCupon1");
  

  
  

  // TODO 5: calcular el porcentaje total de descuento.
  double porcentajeDescuento = descuentoCliente + descuentoCupon;
  print("porcentajeDescuento $porcentajeDescuento");

  // TODO 6: calcular el valor monetario del descuento.
  double valorDescuento = subtotal * porcentajeDescuento;
  double descuentofactura=total1*porcentajeDescuento;
  
  print("Valor del descuento $descuentofactura");

  // TODO 7: calcular el subtotal después del descuento.
  // double subtotalConDescuento = subtotal - valorDescuento;
  double subtotal1 = total1 - descuentofactura;
  print ("El subtotal con descunto es $subtotal1");

  // TODO 9: llamar a calcularTotal con parámetros nombrados (calcula total con IVA incluido).
  double total = calcularTotal(
    subtotal: subtotal,
    porcentajeDescuento: porcentajeDescuento,
    porcentajeIva: porcentajeIva,
  );
  
  print("Total : $total");

  // TODO 8: calcular el IVA (sobre el subtotal ya descontado).
  double impuesto = (subtotal - valorDescuento) * porcentajeIva;
  double iva = (subtotal1)*porcentajeIva;
  print("El impuesto del iva es de ${iva.toStringAsFixed(2)}");

  // El dato dynamic cambia de String a int.
  referenciaPago = 45892;
  compraFinalizada = true;

  // TODO 10: obtener categorías sin repetir usando Set.
  final categorias = <String>{};
  for (var producto in productos) {
    categorias.add(producto['categoria'] as String);
    

  }
  print("Estas son las categorias $categorias");
  
  

  // TODO 11: mostrar la factura.
  mostrarFactura(
    numeroFactura: numeroFactura,
    cliente: nombreCliente,
    correo: correo,
    cupon: cupon,
    subtotal: subtotal,
    descuento: valorDescuento,
    impuesto: impuesto,
    total: total,
  );

  print('Tienda: $nombreTienda');
  print('Fecha: $fechaCompra');
  print('Referencia: $referenciaPago');
  print('Compra finalizada: $compraFinalizada');
  print('Categorías: $categorias');

  // TODO 12: usar if para mostrar un mensaje especial.
  if (total > 350){
    print("COMPRA MAYOR A $total feliciadades recibe envio gratuito" );
  }
  
  
  if (compraFinalizada && total > 200) {
    print(
      '¡Felicidades! Tu compra califica para envío gratis dentro del campus.',
    );
  }
}

double calcularSubtotal(List<Map<String, dynamic>> productos) {
  double subtotal = 0;
  // TODO: recorrer los productos y acumular precio x cantidad.
  for (var prod in productos) {
    double precio = prod['precio'] as double;
    int cantidad = prod['cantidad'] as int;
    subtotal += precio * cantidad;
  }
  return subtotal;
}

double obtenerDescuentoCliente(String tipoCliente) {
  double descuento = 0;
  // TODO: utilizar switch.
  switch (tipoCliente.toLowerCase()) {
    case 'estudiante':
      descuento = 0.10; // 10% de descuento
      break;
    case 'docente':
      descuento = 0.15; // 15% de descuento
      break;
    case 'visitante':
      descuento = 0.0;
      break;
    default:
      descuento = 0.0;
      break;
  }
  return descuento;
}

double calcularTotal({
  required double subtotal,
  required double porcentajeDescuento,
  required double porcentajeIva,
}) {
  // TODO: aplicar descuento e IVA.
  double valorDescuento = subtotal * porcentajeDescuento;
  double subtotalConDescuento = subtotal - valorDescuento;
  double totalImpuesto = subtotalConDescuento * porcentajeIva;
  return subtotalConDescuento + totalImpuesto;
}

void mostrarProductos(List<Map<String, dynamic>> productos) {
  print('PRODUCTOS');
  // TODO: recorrer e imprimir los productos.
  for (var prod in productos) {
    print(
      '- ${prod['nombre']} (${prod['categoria']}): ${prod['cantidad']} x Q${prod['precio']}',
    );
  }
  print('------------------------------');
}

void mostrarFactura({
  required int numeroFactura,
  required String cliente,
  String? correo,
  String? cupon,
  required double subtotal,
  required double descuento,
  required double impuesto,
  required double total,
}) {
  print('\nFACTURA No. $numeroFactura');
  print('Cliente: $cliente');
  // Null safety mediante el operador ??.
  print('Correo: ${correo ?? 'No registrado'}');
  print('Cupón: ${cupon ?? 'Sin cupón'}');
  print('Subtotal: Q${subtotal.toStringAsFixed(2)}');
  print('Descuento: Q${descuento.toStringAsFixed(2)}');
  print('IVA: Q${impuesto.toStringAsFixed(2)}');
  print('Total: Q${total.toStringAsFixed(2)}');
}
