contar_num_gols <- function(vetor) {
  stringr::str_split(vetor, pattern = "x") |>
    purrr::flatten() |>
    as.numeric() |>
    sum()
}

verificar_vencedor <- function(placar) {
  res <- stringr::str_split(placar, pattern = "x")

  if (res[[1]][1] > res[[1]][2]) {
    "mandante"
  } else if (res[[1]][1] < res[[1]][2]) {
    "visitante"
  } else {
    "empate"
  }
}
