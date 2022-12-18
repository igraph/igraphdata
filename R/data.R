

#' Enron Email Network
#'
#' @description
#'
#'   An Enron email dataset has been made public by the U.S. Department of Justice.
#'
#'
#'
#' @name enron
#' @docType data
#' @usage
#' enron
#' @format
#'   A directed \code{igraph} graph object.
#'
#'   Graph attributes: \itemize{
#'     \item \sQuote{LDC_names} The names of the 32 LDC catagories the emails
#'     are classfied into by Michael W. Berry
#'     (\url{http://www.cis.jhu.edu/~parky/Enron/Anno_Topic_exp_LDC.pdf})
#'     \item \sQuote{LDC_desc} Longer descriptions of the 32 LDC
#'     categories.
#'     \item \sQuote{Citation} Additionally, see also the references below.
#'     \item \sQuote{name}
#'   }
#'
#'   Vertex attributes: \itemize{
#'     \item \sQuote{Email} Email address.
#'     \item \sQuote{Name} Real name.
#'     \item \sQuote{Note} E.g. position at Enron.
#'   }
#'
#'   Edge attributes: \itemize{
#'     \item \sQuote{Time} When the email was sent. Note that some time
#'     labels are from 1979, these are certainly wrong and you might want
#'     to remove them before analyses that include time.
#'     \item \sQuote{Reciptype} Recipient type, \sQuote{to}, \sQuote{cc} or
#'     \sQuote{bcc}.
#'     \item \sQuote{Topic} Assigned based on 3-means clustering of
#'     randomly selected 3,120 out of all 125,409 messages, then NN
#'     classification for the whole corpus. Note that topic 0 means an
#'     outlier, e.g., too few words or all meaningless numbers in the
#'     message body.
#'     \item \sQuote{LDC_topic} Assigned based on Michael W. Berry's 2001
#'     \dQuote{Annotated (by Topic) Enron Email Data Set.}
#'     (\url{http://www.cis.jhu.edu/~parky/Enron/Anno_Topic_exp_LDC.pdf})
#'     There are 32 topics. Topic "0" means an outlier, e.g., too few words
#'     or all meaningless numbers in the message body, etc. Topic "-1"
#'     means there is no matching topic.
#'   }
#' @references
#'   C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park,
#'   Scan Statistics on Enron Graphs Computational and Mathematical
#'   Organization Theory, Volume 11, Number 3, p229 - 247, October 2005,
#'   Springer Science+Business Media B.V.
#'
#'   C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park,
#'   Scan Statistics on Enron Graphs, SIAM International Conference on
#'   Data Mining, Workshop on Link Analysis, Counterterrorism and Security,
#'   Newport Beach, California, April 23, 2005.
#'
#'   Gina Kolata, Enron Offers an Unlikely Boost to E-Mail Surveillance,
#'   New York Times, Week in Review, May 22, 2005.
#'
#'   C.E. Priebe, Scan Statistics on Enron Graphs, IPAM Summer Graduate
#'   School: Intelligent Extraction of Information from Graphs and High
#'   Dimensional Data, UCLA, July 11-29, 2005.
#'
#'   C.E. Priebe, Scan Statistics on Enron Graphs, 2005 Fall Department
#'   of Applied Mathematics and Statistics Seminars, September 15, 2005,
#'   The Johns Hopkins University.
#'
#'   Y. Park, C.E. Priebe, D.J. Marchette, Scan Statistics on Enron
#'   Hypergraphs, Interface 2008, Durham, North Carolina, May 21, 2008,
#'
#'   Y. Park, C.E. Priebe, D.J. Marchette, Anomaly Detection using Scan
#'   Statistics on Enron Graphs and Hypergraphs, The Satellite Workshop of
#'   the IASC 2008 Conference, Seoul, Korea, December 1-3, 2008.
#'
#'   Y. Park, C.E. Priebe, D.J. Marchette, A. Youssef, Anomaly Detection
#'   using Scan Statistics on Time Series of Hypergraphs, Workshop on Link
#'   Analysis, Counterterrorism and Security at the SIAM International
#'   Conference on Data Mining, Sparks, Nevada, May 1-3, 2009,
#'
#'   Y. Park, C.E. Priebe, A. Youssef, Anomaly Detection in Time Series of
#'   Graphs using Fusion of Invariants, Computational and Mathematical
#'   Organization Theory, submitted, 2010.
#' @source
#'   \url{http://www.cis.jhu.edu/~parky/Enron/}
NULL





#' A collection of food webs
#'
#' @description
#' A list of graphs. Each one is a food web, i.e. a directed
#'   graph of predator-prey relationships.
#'
#'
#'
#' @name foodwebs
#' @docType data
#' @usage
#' foodwebs
#' @format
#' A named list of directed \code{igraph} graph objects. Here are the
#' list of the graphs included:
#' \describe{
#'   \item{\sQuote{ChesLower}}{Lower Chesapeake Bay in Summer.
#'
#'   Reference: Hagy, J.D. (2002) Eutrophication, hypoxia and
#'   trophic transfer efficiency in Chesapeake Bay PhD Dissertation,
#'   University of Maryland at College Park (USA), 446 pp.}
#'   \item{\sQuote{ChesMiddle}}{Middle Chesapeake Bay in Summer.
#'
#'   Reference: same as for \sQuote{ChesLower}.}
#'   \item{\sQuote{ChesUpper}}{Upper Chesapeake Bay in Summer.
#'
#'   Reference: same as for \sQuote{ChesLower}.}
#'   \item{\sQuote{Chesapeake}}{Chesapeake Bay Mesohaline Network.
#'
#'   Reference: Baird D. & Ulanowicz R.E. (1989) The seasonal dynamics
#'   of the Chesapeake Bay ecosystem. Ecological Monographs 59:329-364.}
#'   \item{\sQuote{CrystalC}}{Crystal River Creek (Control).
#'
#'   Reference: Homer, M. and W.M. Kemp. Unpublished Ms. See also
#'   Ulanowicz, R.E. 1986. Growth and Development: Ecosystems
#'   Phenomenology. Springer, New York. pp 69-79.}
#'   \item{\sQuote{CrystalD}}{Crystal River Creek (Delta Temp).
#'
#'   Reference: same as for \sQuote{CrystalD}.}
#'   \item{\sQuote{Maspalomas}}{Charca de Maspalomas.
#'
#'   Reference: Almunia, J., G. Basterretxea, J. Aristegui, and
#'   R.E. Ulanowicz. (1999) Benthic- Pelagic switching in a coastal
#'   subtropical lagoon. Estuarine, Coastal and Shelf Science
#'   49:363-384.}
#'   \item{\sQuote{Michigan}}{Lake Michigan Control network.
#'
#'   Reference: Krause, A. and D. Mason. (In preparation.) A. Krause,
#'   PhD. Dissertation, Michigan State University. Ann Arbor, MI. USA.}
#'   \item{\sQuote{Mondego}}{Mondego Estuary - Zostrea site.
#'
#'   Reference: Patricio, J. (In Preparation) Master's
#'   Thesis. University of Coimbra, Coimbra, Portugal.}
#'   \item{\sQuote{Narragan}}{Narragansett Bay Model.
#'
#'   Reference: Monaco, M.E. and R.E. Ulanowicz. (1997) Comparative
#'   ecosystem trophic structure of three U.S. Mid-Atlantic
#'   estuaries. Mar. Ecol. Prog. Ser. 161:239-254.}
#'   \item{\sQuote{Rhode}}{Rhode River Watershed - Water Budget.
#'
#'   Reference: Correll, D. (Unpublished manuscript) Smithsonian
#'   Institute, Chesapeake Bay Center for Environmental Research,
#'   Edgewater, Maryland 21037-0028 USA.}
#'   \item{\sQuote{StMarks}}{St. Marks River (Florida) Flow network.
#'
#'   Reference: Baird, D., J. Luczkovich and R. R. Christian. (1998)
#'   Assessment of spatial and temporal variability in ecosystem
#'   attributes of the St Marks National Wildlife Refuge, Apalachee Bay,
#'   Florida. Estuarine, Coastal, and Shelf Science 47: 329-349.}
#'   \item{\sQuote{baydry}}{Florida Bay Trophic Exchange Matrix, dry season.
#'
#'   Reference: Ulanowicz, R. E., C. Bondavalli, and
#'   M. S. Egnotovich. 1998. Network analysis of trophic dynamics in
#'   South Florida ecosystems, FY 97: the Florida Bay ecosystem. Annual
#'   Report to the United States Geological Service Biological Resources
#'   Division, University of Miami Coral Gables, \[UM-CES\] CBL 98-123,
#'   Maryland System Center for Environmental Science, Chesapeake
#'   Biological Laboratory, Maryland, USA.}
#'   \item{\sQuote{baywet}}{Florida Bay Trophic Exchange Matrix, wet season.
#'
#'   Reference: same as for \sQuote{baydry}.}
#'   \item{\sQuote{cypdry}}{Cypress, dry season.
#'
#'   Reference: Ulanowicz, R. E., C. Bondavalli, and
#'   M. S. Egnotovich. 1997. Network analysis of trophic dynamics in
#'   South Florida ecosystems, FY 96: the cypress wetland
#'   ecosystem. Annual Report to the United States Geological Service
#'   Biological Resources Division, University of Miami Coral Gables,
#'   \[UM-CES\] CBL 97-075, Maryland System Center for Environmental
#'   Science, Chesapeake Biological Laboratory.}
#'   \item{\sQuote{cypwet}}{Cypress, wet season.
#'
#'   Reference: same as for \sQuote{cypdry}.}
#'   \item{\sQuote{gramdry}}{Everglades Graminoids - Dry Season.
#'
#'   Reference: Ulanowicz, R. E., J. J. Heymans, and
#'   M. S. Egnotovich. 2000. Network analysis of trophic dynamics in
#'   South Florida ecosystems, FY 99: the graminoid ecosystem. Technical
#'   Report TS-191-99, Maryland System Center for Environmental Science,
#'   Chesapeake Biological Laboratory, Maryland, USA.}
#'   \item{\sQuote{gramwet}}{Everglades Graminoids - Wet Season.
#'
#'   Reference: same as for \sQuote{gramdry}.}
#'   \item{\sQuote{mangdry}}{Mangrove Estuary, Dry Season.
#'
#'   Reference: Ulanowicz, R. E., C. Bondavalli, J. J. Heymans, and
#'   M. S. Egnotovich. 1999. Network analysis of trophic dynamics in
#'   South Florida ecosystems, FY 98: the mangrove ecosystem. Technical
#'   Report TS-191-99, Maryland System Center for Environmental Science,
#'   Chesapeake Biological Laboratory, Maryland, USA.}
#'   \item{\sQuote{mangwet}}{Mangrove Estuary, Wet Season.
#'
#'   Reference: same as for \sQuote{mangdry}.}
#' }
#'
#' Each graph has the following vertex attributes: \sQuote{name} is the
#' name of the species, \sQuote{ECO} is the type of the node, and
#' integer value between one and five, meaning:
#' \enumerate{
#'   \item Living/producing compartment
#'   \item Other compartment
#'   \item Input
#'   \item Output
#'   \item Respiration.
#' }
#' The \sQuote{Biomass} vertex attribute contains the biomass of the
#' species.
#'
#' Edges are weighted, and the weights denote energy flux between the
#' species involved.
#'
#' The graphs also contain some informative graph attributes:
#' \sQuote{Author}, \sQuote{Citation}, \sQuote{URL}, and
#' \sQuote{name}.
#' @references See them above.
#' @source See references for the individual webs above. The data itself
#'   was downloaded from
#'   \url{http://vlado.fmf.uni-lj.si/pub/networks/data/bio/foodweb/foodweb.htm}.
#' @keywords datasets
NULL





#' The igraphdata package
#'
#' @description
#' The igraphdata package provides various data sets
#'
#'
#'
#' @name igraphdata-package
#' @aliases igraphdata-package igraphdata
#' @docType package
#' @section How to use the data sets:
#'   After loading the \code{igraphdata} package, the various data sets can
#'   be loaded using the regular \code{\link{data}} command.
#'
#'   Type in \preformatted{  data(package="igraphdata")}
#'   to get a list of data sets included in this package.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references \code{\link{data}}
NULL





#' Immunoglobulin interaction network
#'
#' @description
#'
#'   The undirected and connected network of interactions
#'   in the immunoglobulin protein. It is made up of 1316 vertices
#'   representing amino-acids and an edge is drawn between two
#'   amino-acids if the shortest distance between their C_alpha atoms
#'   is smaller than the threshold value \eqn{\theta=8}{theta=8} Angstrom.
#'
#'
#'
#' @name immuno
#' @docType data
#' @usage
#' immuno
#' @format
#'   An undirected \code{igraph} graph object.
#'
#'   Graph attributes: \sQuote{name}, \sQuote{Citation}, \sQuote{Author}.
#' @references
#'   D. Gfeller, Simplifying complex networks: from a clustering to a
#'   coarse graining strategy, \emph{PhD Thesis EPFL}, no 3888, 2007.
#'   \url{http://library.epfl.ch/theses/?nr=3888}
#' @source
#'   See reference below.
#' @keywords datasets
NULL





#' Zachary's karate club network
#'
#' @description
#'
#'   Social network between members of a university karate club, led by
#'   president John A. and karate instructor Mr. Hi (pseudonyms).
#'
#'   The edge weights are the number of common activities the club
#'   members took part of. These activities were:
#'   \enumerate{
#'     \item Association in and between academic classes at the university.
#'     \item Membership in Mr. Hi's private karate studio on the east side
#'     of the city where Mr. Hi taught nights as a part-time instructor.
#'     \item Membership in Mr. Hi's private karate studio on the east side
#'     of the city, where many of his supporters worked out on weekends.
#'     \item Student teaching at the east-side karate studio referred to in
#'     (2). This is different from (2) in that student teachers interacted
#'     with each other, but were prohibited from interacting with their
#'     students.
#'     \item Interaction at the university rathskeller, located in the same
#'     basement as the karate club's workout area.
#'     \item Interaction at a student-oriented bar located across the
#'     street from the university campus.
#'     \item Attendance at open karate tournaments held through the area at
#'     private karate studios.
#'     \item Attendance at intercollegiate karate tournaments held at local
#'     universities. Since both open and intercollegiate tournaments were
#'     held on Saturdays, attendance at both was impossible.
#'   }
#'
#'   Zachary studied conflict and fission in this network, as the karate
#'   club was split into two separate clubs, after long disputes between
#'   two factions of the club, one led by John A., the other by Mr. Hi.
#'
#'   The \sQuote{Faction} vertex attribute gives the faction memberships of
#'   the actors. After the split of the club, club members chose their
#'   new clubs based on their factions, except actor no. 9, who was in John
#'   A.'s faction but chose Mr. Hi's club.
#'
#'
#'
#' @name karate
#' @docType data
#' @usage
#' karate
#' @format
#'   An undirected \code{igraph} graph object. Vertex no. 1 is Mr. Hi,
#'   vertex no. 34 corresponds to John A.
#'
#'   Graph attributes: \sQuote{name}, \sQuote{Citation}, \sQuote{Author}.
#'
#'   Vertex attributes: \sQuote{name}, \sQuote{Faction}, \sQuote{color} is
#'   the same as \sQuote{Faction}, \sQuote{label} are short labels for plotting.
#'
#'   Edge attribute: \sQuote{weight}.
#' @references
#'   Wayne W. Zachary. An Information Flow Model for Conflict and Fission
#'   in Small Groups. \emph{Journal of Anthropological Research} Vol. 33,
#'   No. 4 452-473
#' @source
#'   See reference below.
#' @keywords datasets
NULL





#' Krackhardt's kite
#'
#' @description
#'
#'   Krackhardt's kite is a fictionary social network with ten actors.
#'   It is the smallest graph for which the most central actor is different
#'   according to the three classic centality measures: degree, closeness
#'   and betweenness.
#'
#'
#'
#' @name kite
#' @docType data
#' @usage
#' kite
#' @format
#'   An undirected igraph graph with graph attributes \code{name},
#'   \code{layout}, \code{Citation}, \code{Author}, \code{URL}, and vertex
#'   attributes \code{label}, \code{name} and \code{Firstname}.
#' @references
#'   Assessing the Political Landscape: Structure, Cognition, and Power in
#'   Organizations. David Krackhardt. \emph{Admin. Sci. Quart.} 35, 342-369,
#'   1990.
#' @source
#'   \url{http://www.orgnet.com/sna.html}
#' @keywords datasets
NULL





#' Bridges of Koenigsberg from Euler's times
#'
#' @description
#'
#'   The Seven Bridges of Koenigsberg is a notable historical problem in
#'   mathematics. Its negative resolution by Leonhard Euler in 1735 laid
#'   the foundations of graph theory and presaged the idea of topology.
#'
#'   The city of Koenigsberg in Prussia (now Kaliningrad, Russia) was set on
#'   both sides of the Pregel River, and included two large islands which
#'   were connected to each other and the mainland by seven bridges
#'
#'   The problem was to find a walk through the city that would cross each
#'   bridge once and only once. The islands could not be reached by any route
#'   other than the bridges, and every bridge must have been crossed
#'   completely every time (one could not walk half way onto the bridge and
#'   then turn around and later cross the other half from the other side).
#'
#'   Euler proved that the problem has no solution.
#'
#'
#'
#' @name Koenigsberg
#' @docType data
#' @usage
#' Koenigsberg
#' @format
#'   An undirected \code{igraph} graph object with vertex attributes
#'   \sQuote{name} and \sQuote{Euler_letter}, the latter is the notation
#'   from Eulers original paper; and edge attributes \code{name} (the name
#'   of the bridge) and \sQuote{Euler_letter}, again, Euler's notation
#'   from his paper.
#'
#'   This dataset is in the public domain.
#' @source Wikipedia,
#'   \url{http://de.wikipedia.org/wiki/K%C3%B6nigsberger_Br%C3%BCcken}
#' @keywords datasets
NULL





#' Visuotactile brain areas and connections
#'
#' @description
#'
#'   Graph model of the visuotactile brain areas and connections of the
#'   macaque monkey. The model consists of 45 areas and 463 directed
#'   connections.
#'
#'
#'
#' @name macaque
#' @docType data
#' @usage
#' macaque
#' @format
#'   A directed \code{igraph} graph object with vertex attributes
#'   \sQuote{name} and \sQuote{shape}.
#'
#'   This dataset is licensed under a Creative Commons
#'   Attribution-Share Alike 2.0 UK: England & Wales License,
#'   see \url{http://creativecommons.org/licenses/by-sa/2.0/uk/} for details.
#'   Please cite the reference below if you use this dataset.
#' @references Negyessy L., Nepusz T., Kocsis L., Bazso F.: Prediction of
#'   the main cortical areas and connections involved in the tactile
#'   function of the visual cortex by network analysis. \emph{European
#'     Journal of Neuroscience}, 23(7): 1919-1930, 2006.
#' @source See reference below.
#' @keywords datasets
NULL





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
#' @source
#'   See the reference below.
#'   Please cite it if you use this dataset in your work.
#' @keywords datasets
NULL





#' Friendship network of a UK university faculty
#'
#' @description
#' The personal friendship network of a faculty of a UK
#'   university, consisting of 81 vertices (individuals) and 817 directed
#'   and weighted connections. The school affiliation of each individual is
#'   stored as a vertex attribute. This dataset can serve as a testbed for
#'   community detection algorithms.
#'
#'
#'
#' @name UKfaculty
#' @docType data
#' @usage
#' UKfaculty
#' @format
#'   A directed \code{igraph} graph object with vertex attribute
#'   \sQuote{Group}, the numeric id of the school affiliation, and edge
#'   attribute \sQuote{weight}, i.e. the graph is weighted.
#'
#'   This dataset is licensed under a Creative Commons
#'   Attribution-Share Alike 2.0 UK: England & Wales License,
#'   see \url{http://creativecommons.org/licenses/by-sa/2.0/uk/} for details.
#'   Please cite the reference below if you use this dataset.
#' @references Nepusz T., Petroczi A., Negyessy L., Bazso F.: Fuzzy
#'   communities and the concept of bridgeness in complex
#'   networks. Physical Review E 77:016107, 2008.
#' @source See reference below.
#' @keywords datasets
NULL





#' US airport network, 2010 December
#'
#' @description
#'
#'   The network of passanger flights between airports in the United
#'   States. The data set was compiled based on flights in 2010
#'   December. This network is directed and edge directions correspond to
#'   flight directions. Each edge is specific to a single carrier aircraft
#'   type. Multiple carriers between the same two airports are denoted by
#'   multiple edges.
#'
#'   See information about the included meta-data below.
#'
#'
#'
#' @name USairports
#' @docType data
#' @usage
#' USairports
#' @format
#'   A directed \code{igraph} graph object, with multiple edges. It has a
#'   \sQuote{name} graph attribute, and several vertex and edge
#'   attributes. The vertex attributes:
#'   \describe{
#'     \item{name}{Symbolic vertex name, this is the three letter IATA
#'       airport code.}
#'     \item{City}{City and state, where the airport is located.}
#'     \item{Position}{Position of the airport, in WGS coordinates.}
#'   }
#'
#'   Edge attributes:
#'   \describe{
#'     \item{Carrier}{Name of the airline. The network includes both
#'       domestic and international carriers that performed at least one
#'       flight in December of 2010.}
#'     \item{Departures}{The number of departures (for a given airline and
#'       aircraft type.}
#'     \item{Seats}{The total number of seats available on the flights
#'       carried out by a given airline, using a given aircraft type.}
#'     \item{Passengers}{The total number of passangers on the flights
#'       carried out by a given airline, using a given aircraft type.}
#'     \item{Aircraft}{Type of the aircraft.}
#'     \item{Distance}{The distance between the two airports, in miles.}
#'   }
#' @source
#'   Most of this information was downloaded from The Research and
#'   Innovative Technology Administration (RITA). See
#'   \url{http://www.rita.dot.gov/about_rita/} for details. The airport
#'   position information was collected from Wikipedia and other public
#'   online sources.
#' @keywords datasets
NULL





#' Yeast protein interaction network
#'
#' @description
#'
#'   Comprehensive protein-protein interaction maps promise to reveal many
#'   aspects of the complex regulatory network underlying cellular
#'   function.
#'
#'   This data set was compiled by von Mering et al. (see reference below),
#'   combining various sources. Only the interactions that have
#'   \sQuote{high} and \sQuote{medium} confidence are included here.
#'
#'
#'
#' @name yeast
#' @docType data
#' @usage
#' yeast
#' @format
#'   An undirected \code{igraph} graph object. Its graph attributes:
#'   \sQuote{name}, \sQuote{Citation}, \sQuote{Author},
#'   \sQuote{URL}. \sQuote{Classes}. The \sQuote{Classes}
#'   attribute contain the key for the classification labels of the
#'   proteins, in a data frame, the original MIPS categories are given
#'   after the semicolon:
#'   \describe{
#'     \item{E}{energy production; energy}
#'     \item{G}{aminoacid metabolism; aminoacid metabolism}
#'     \item{M}{other metabolism; all remaining metabolism categories}
#'     \item{P}{translation; protein synthesis}
#'     \item{T}{transcription; transcription, but without subcategory
#'       \sQuote{transcriptional control}}
#'     \item{B}{transcriptional control; subcategory
#'       \sQuote{transcriptional control}}
#'     \item{F}{protein fate; protein fate (folding, modification,
#'       destination)}
#'     \item{O}{cellular organization; cellular transport and transport
#'       mechanisms}
#'     \item{A}{transport and sensing; categories \sQuote{transport
#' 	facilitation} and \sQuote{regulation of / interaction with
#' 	cellular environment}}
#'     \item{R}{stress and defense; cell rescue, defense and virulence}
#'     \item{D}{genome maintenance; DNA processing and cell cycle}
#'     \item{C}{cellular fate / organization; categories \sQuote{cell fate}
#'       and \sQuote{cellular communication /  signal transduction} and
#'       \sQuote{control of cellular organization}}
#'     \item{U}{uncharacterized; categories \sQuote{not yet clear-cut} and
#'       \sQuote{uncharacterized}}
#'   }
#'
#'   Vertex attributes: \sQuote{name}, \sQuote{Description},
#'   \sQuote{Class}, the last one contains the class of the protein,
#'   accoring to the classification above.
#'
#'   Note that some proteins in the network did not appear in the
#'   annotation files, the \sQuote{Class} and \sQuote{Description}
#'   attributes are \code{NA} for these.
#' @references
#' Comparative assessment of large-scale data sets of protein-protein
#'   interactions. Christian von Mering, Roland Krause, Berend Snel,
#'   Michael Cornell, Stephen G. Oliver, Stanley Fields and Peer
#'   Bork. \emph{Nature} 417, 399-403 (2002)
#' @source The data was downloaded from
#'   \url{http://www.nature.com/nature/journal/v417/n6887/suppinfo/nature750.html}.
#' @keywords datasets
NULL



