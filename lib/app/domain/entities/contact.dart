class Contact {
  int id;
  String nome;
  String telefone;
  String email;
  String urlAvatar;

  Contact(
      {required this.id,
      required this.nome,
      required this.telefone,
      required this.email,
      required this.urlAvatar}) {
    this.id = id;
    this.nome = nome;
    this.telefone = telefone;
    this.email = email;
    this.urlAvatar = urlAvatar;
  }
}
