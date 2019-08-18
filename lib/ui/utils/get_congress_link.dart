String getCongressLink(event) {
  if (event == "arquitetura") {
    return "https://eventos.sereduc.com/evento/217/3-congresso-nacional-de-arquitetura-e-urbanismo-belempa";
  } else if (event == "computacao") {
    return "https://eventos.sereduc.com/evento/215/3-congresso-nacional-de-informatica-belempa";
  } else if (event == "engenharia") {
    return "https://eventos.sereduc.com/evento/216/3-congresso-nacional-de-engenharia-belempa";
  }

  return "https://eventos.sereduc.com";
}
