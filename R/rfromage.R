#' The Cheese Distribution
#' 
#' A delicious uniformly at random-ly generated cheese.
#' 
#' @export
rfromage <- function() {
  
  # Randomly select cheese
  dat <- fromagerie::fromage |> 
    dplyr::sample_n(size = 1)
  
  # get cheese family
  dat_fam <- fromagerie::ref_fromagefam |> 
    dplyr::filter(fromage_famille == dat$fromage_famille)
  # get milk treatment
  dat_milk_trt <- dplyr::case_when(
    dat$lait_traitment == "cru" ~ "raw",
    dat$lait_traitment == "pasteurisé" ~ "pasteurised",
    grepl("cru", dat$lait_traitment) & grepl("pasteurisé", dat$lait_traitment) ~ "raw or pasteurised",
    grepl("cru", dat$lait_traitment) & grepl("pasteurisé", dat$lait_traitment) ~ "heated or pasteurised",
    TRUE ~ ""
  )
  # get milk type
  dat_milk_ani <- dplyr::case_when(
    dat$lait_animal == "vache" ~ "cow",
    dat$lait_animal == "brebis" ~ "sheep",
    dat$lait_animal == "chèvre" ~ "goat"
  )
  
  # Generate output
  cat(
    "Here, try some ", dat$nom, " !",
    "\n", dat$nom, " is a ", tolower(dat_fam$fromage_famille_en),
    " made from ", dat_milk_trt, " ", dat_milk, "'s milk,",
    "\n    and is produced in the following departments: ", dat$departements, ".",
    sep = ""
  )
  
}