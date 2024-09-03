
# Cheese !
fromage <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "main") |> 
  tibble::tibble() |> 
  dplyr::select(-dplyr::starts_with("_"))
usethis::use_data(fromage, overwrite = TRUE)

# Region-departement
ref_region_departement <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "region_departement") |> 
  tibble::tibble()
usethis::use_data(ref_region_departement, overwrite = TRUE)

# Cheese family
ref_fromagefam <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "fromage_famille") |> 
  tibble::tibble()
usethis::use_data(ref_fromagefam, overwrite = TRUE)




# test --------------------------------------------------------------------

fromage |> 
  tidyr::separate_wider_delim(
    cols = "departement",
    delim = ",",
    names_sep = "_",
    too_few = "align_start"
  ) |> 
  dplyr::mutate(
    dplyr::across(
      .cols = dplyr::starts_with("departement"), .fns = ~ stringr::str_trim(.x, side = "both")
    )
  )