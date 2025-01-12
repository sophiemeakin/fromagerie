#' The Cheese Distribution
#' 
#' A delicious cheese, generated uniformly at random.
#' 
#' @export
rfromage <- function() {
  
  # Randomly select cheese
  dat <- fromagerie::fromage |> 
    dplyr::sample_n(size = 1)
  
  # get cheese family
  dat_fam <- fromagerie::ref_fromagefam |> 
    dplyr::filter(cheese_type == dat$cheese_type)
  # get milk treatment
  dat_milk_trt <- dplyr::case_when(
    dat$milk_treatment == "cru" ~ "raw",
    dat$milk_treatment == "pasteurisé" ~ "pasteurised",
    grepl("cru", dat$milk_treatment) & grepl("pasteurisé", dat$milk_treatment) ~ "raw or pasteurised",
    grepl("cru", dat$milk_treatment) & grepl("pasteurisé", dat$milk_treatment) ~ "heated or pasteurised",
    TRUE ~ ""
  )
  # get milk type
  dat_milk_ani <- dplyr::case_when(
    dat$milk_animal == "vache" ~ "cow",
    dat$milk_animal == "brebis" ~ "sheep",
    dat$milk_animal == "chèvre" ~ "goat"
  )
  
  # Generate output
  cat(
    "Here, try some ", dat$name, " !",
    "\n", dat$name, " is a ", tolower(dat_fam$cheese_type_en),
    " made from ", dat_milk_trt, " ", dat_milk_ani, "'s milk,",
    "\n  and is produced in the following region(s): ", dat$regions, ".",
    sep = ""
  )
  
}