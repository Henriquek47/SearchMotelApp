enum FiltersItems {
  withDiscount("Com desconto"),
  available("Disponível"),
  hydromassage("Hidromassagem"),
  sauna("Sauna"),
  eroticDecoration("Decoração erótica"),
  themedDecoration("Decoração temática"),
  wifi("Wi-Fi"),
  minibar("Minibar"),
  garage("Garagem");

  final String label;
  const FiltersItems(this.label);
}

enum FiltersHours {
  overnight("1 hora"),
  oneHour("2 horas"),
  twoHours("3 horas"),
  fourHours("4 horas"),
  sixHours("5 horas"),
  eightHours("6 horas"),
  fullDay("Dia todo"),
  earlyMorning("Madrugada");

  final String label;
  const FiltersHours(this.label);
}
