dados <- readr::read_csv("https://raw.githubusercontent.com/williamorim/brasileirao/master/data-raw/csv/matches.csv")

contar_num_gols <- function(vetor) {
  stringr::str_split(vetor, pattern = "x") |>
    purrr::flatten() |>
    as.numeric() |>
    sum()
}

dados |>
  dplyr::filter(score != "x") |>
  dplyr::group_by(season) |>
  dplyr::summarise(
    num_gols = contar_num_gols(score),
    num_partidas = dplyr::n()
  ) |>
  dplyr::mutate(
    media_gols = num_gols / num_partidas
  )


stringr::str_split(c("0x1", "2x1"), pattern = "x") |>
  purrr::flatten() |>
  as.numeric() |>
  sum()


# -------------------------------------------------------------------------

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

dados |>
  dplyr::mutate(
    vencedor = purrr::map_chr(score, verificar_vencedor)
  ) |>
  dplyr::count(season, vencedor)




