#' Hospital encounter network data
#'
#' @description
#'
#'   Records of contacts among patients and various types of health care
#'   workers in the geriatric unit of a hospital in Lyon, France, in
#'   2010, from 1pm on Monday, December 6 to 2pm on Friday, December
#'   10. Each of the 75 people in this study consented to wear RFID
#'   sensors on small identification badges during this period, which made
#'   it possible to record when any two of them were in face-to-face
#'   contact with each other (i.e., within 1-1.5 m of each other) during
#'   a 20-second interval of time.
#'
#'
#'
#' @name rfid
#' @docType data
#' @usage
#' rfid
#' @format
#'   An igraph graph with graph attributes \sQuote{name} and
#'   \sQuote{Citation}, vertex attribute \sQuote{Status} and edge attribute
#'   \sQuote{Time}.
#'
#'   \sQuote{Status} is the status of the person. Status codes:
#'   administrative staff (ADM), medical doctor (MED), paramedical staff,
#'   such as nurses or nurses' aides (NUR), and patients (PAT).
#'
#'   \sQuote{Time} is the time of the encounter, it is the second when the
#'   20 second encounter terminated.
#' @references
#'   P. Vanhems, A. Barrat, C. Cattuto, J.-F. Pinton, N. Khanafer,
#'   C. Regis, B.-a. Kim, B. Comte, N. Voirin: Estimating potential
#'   infection transmission routes in hospital wards using wearable
#'   proximity sensors. PloS One 8(9), e73970 306 (2013).
#'   \doi{10.1371/journal.pone.0073970}
#' @source
#'   See the reference below.
#'   Please cite it if you use this dataset in your work.
#' @keywords datasets
NULL
