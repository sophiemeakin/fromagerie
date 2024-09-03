#' French cheese data
#'
#' A dataset containing information about French cheeses.
#'
#'@format A data frame containing all the colours used in the palette:
#'\itemize{
#'   \item nom: The name of the cheese
#'   \item nom_alt: Alternative name(s) for the cheese, if any
#'   \item departements: The department(s) where the cheese is typically produced; multiple departements are comma-delimited
#'   \item fromage_famille: Type of cheese
#'   \item lait_tratment: Treatment of milk to produce the cheese (raw, pasteurised, or either)
#'   \item lait_animal: Type of milk (cow, sheep, goat, or other)
#'   \item aoc: Whether the cheese is a "Appellation d'Origine Contrôlée"
#'   \item aoc_year: The year that the cheese was given AOC status
#'}
"fromage"


#' Reference table between regions and departements
#'
#' Reference table between French regions (admin-1) and departements (admin-2).
#'
#'@format A data frame containing all the colours used in the palette:
#'\itemize{
#'   \item insee_code: INSEE departement code
#'   \item region: Region name
#'   \item departement: Departement name
#'}
"ref_region_departement"


#' Reference table for cheese families
#'
#' Reference table between cheese family abbreviations and their definitions in French and English
#'
#'@format A data frame containing all the colours used in the palette:
#'\itemize{
#'   \item fromage_famille: Family abbreviation, used in `fromage`
#'   \item fromage_famille_fr: Family definition (FR)
#'   \item fromage_famille_en: Family definition (EN)
#'}
"ref_fromagefam"
