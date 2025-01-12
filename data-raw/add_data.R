
# Region-departement
ref_region_departement <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "region_department") |> 
  tibble::tibble()
usethis::use_data(ref_region_departement, overwrite = TRUE)

# Cheese family
ref_fromagefam <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "cheese_type") |> 
  tibble::tibble()
usethis::use_data(ref_fromagefam, overwrite = TRUE)

# Cheese !
fromage <- rio::import(
  file = here::here("data-raw", "cheese.xlsx"),
  sheet = "main"
) |> 
  tibble::tibble() |> 
  dplyr::select(-dplyr::starts_with("_")) |> 
  dplyr::mutate(departments = department) |> 
  tidyr::separate_wider_delim(
    cols = "department",
    delim = ",",
    names_sep = "_",
    too_few = "align_start"
  ) |> 
  dplyr::mutate(
    dplyr::across(
      .cols = dplyr::starts_with("department_"), .fns = ~ stringr::str_trim(.x, side = "both")
    )
  ) |> 
  tidyr::pivot_longer(
    cols = dplyr::starts_with("department_"), values_to = "department"
  ) |> 
  dplyr::filter(!is.na(department)) |> 
  dplyr::left_join(ref_region_departement, by = "department") |> 
  dplyr::mutate(name = stringr::str_replace(name, "department", "region")) |> 
  dplyr::select(-c(insee_code, department)) |> 
  tidyr::pivot_wider(values_from = region) |> 
  dplyr::rowwise() |> 
  dplyr::mutate(
    regions = paste(unique(c(region_1, region_2, region_3, region_4, region_5, region_6)), collapse = ", "),
    regions = stringr::str_remove(regions, ", NA")
  ) |>
  dplyr::ungroup() |> 
  dplyr::select(
    name = cheese_name, name_alt = cheese_name_alt,
    departments, regions,
    cheese_type,
    milk_treatment,
    milk_animal,
    aoc_yn = aoc,
    aoc_annee
  )
usethis::use_data(fromage, overwrite = TRUE)

