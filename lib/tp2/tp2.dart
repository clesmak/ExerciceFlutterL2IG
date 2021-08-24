import 'dart:math';

String majeurMineur() {
  int age = 10;
  String _genre = 'M';
  String genre = _genre.toUpperCase();
  return (age < 18 && genre == 'M'
      ? "Homme Mineur"
      : age < 18 && genre == 'F'
          ? "Femme Mineure"
          : age >= 18 && genre == 'M'
              ? "Homme Majeur"
              : "Femme Majeure");
}

String majeurMineur2() {
  int age = 19;
  String genre = 'F';
  String _genre;
  if (age < 18 && genre == 'M') {
    _genre = "HOMME MINEUR";
  } else if (age < 18 && genre == 'F') {
    _genre = "FEMME MINEURE";
  } else if (age > 18 && genre == 'M') {
    _genre = "HOMME MAGEUR";
  } else {
    _genre = "FEMME MAGEURE";
  }
  return _genre;
}

String bonjourLeMonde() {
  return "Bonjour Le monde";
}

double equationSecondDegre() {
  double a = 3, b = 4, c = 2;
  double delta;
  delta = pow(b, 2) - (4 * a * c);
  return delta;
}

double moyenneCinqNombre() {
  int a = 4, b = 6, c = 2, d = 3, somme;
  somme = a + b + c + d;
  return somme / 4;
}

int factoriel(int value) {
  int retour = value;
  for (int i = value; i == 0; i--) {
    retour *= i;
  }
  return retour;
}
