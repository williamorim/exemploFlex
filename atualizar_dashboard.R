install.packages(c("renv", "dplyr"))

pacotes <- renv::dependencies() |>
  dplyr::filter(!Package %in% c("renv", "dplyr")) |>
  dplyr::pull(Package) |>
  unique()

install.packages(pacotes)

rmarkdown::render("index.Rmd")
