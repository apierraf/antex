class Servicios {
  String? nombre;
  double? precio;
  bool? isSelect;

  Servicios(this.nombre, this.precio, this.isSelect);

  String toString() => this.nombre!;
}
