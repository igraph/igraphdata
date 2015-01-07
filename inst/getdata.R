
#   igraphdata R package
#   Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard st, 02139 Cambridge, MA, USA
#   
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

library(igraph)

tmp <- tempdir()

#####################################################################
## Foodwebs

u1 <- "http://vlado.fmf.uni-lj.si/pub/networks/data/bio/FoodWeb/Webs_paj.zip"
u2 <- "http://vlado.fmf.uni-lj.si/pub/networks/data/bio/FoodWeb/ATLSS_paj.zip"
foodzip <- paste(tmp, sep="/", c("f1.zip", "f2.zip"))
download.file(url=u1, destfile=foodzip[1])
download.file(url=u2, destfile=foodzip[2])
unlink(paste(tmp, sep="/", "paj"), recursive=TRUE)
system(paste("cd", tmp, ";", "unzip", foodzip[1]))
system(paste("cd", tmp, ";", "unzip", foodzip[2]))
system(paste("cd", tmp, ";", "mv *.paj paj/"))

pajfiles <- list.files(paste(tmp, sep="/", "paj"), full.names=TRUE)

readpaj <- function(filename) {
  lines <- readLines(filename)
  lines <- grep("^%", lines, invert=TRUE, value=TRUE)       # comments
  lines <- grep("^[ \t]*$", lines, invert=TRUE, value=TRUE) # empty lines

  eco <- lines[grep("^\\*partitio", lines)[1]:
               (grep("^\\*network", lines)[1]-1)]
  net <- lines[grep("^\\*network", lines)[1]:(grep("^\\*vector", lines)[1]-1)]
  bim <- lines[grep("^\\*vector", lines)[1]:length(lines)]

  tf <- tempfile()
  cat(net, file=tf, sep="\n")
  G <- read_graph(tf, format="pajek")
  V(G)$name <- V(G)$id
  G <- delete_vertex_attr(G, "id")
  V(G)$ECO <- as.numeric(eco[-(1:2)])
  V(G)$Biomass <- as.numeric(bim[-(1:2)])
  G
}

foodwebs <- lapply(pajfiles, readpaj)
names(foodwebs) <- sub("\\.paj$", "", basename(pajfiles))

foodwebs <- foodwebs[setdiff(names(foodwebs), c("Everglades", "Florida"))]

authors <- c("ChesLower", "Hagy, J.D.",
             "ChesMiddle", "Hagy, J.D.",
             "ChesUpper", "Hagy, J.D.",
             "Chesapeake", "Baird, D. and R.E. Ulanowicz",
             "CrystalC", "Homer, M. and W.M. Kemp",
             "CryslalD", "Homer, M. and W.M. Kemp",
             "Maspalomas",
             "Almunia, J., G. Basterretxea, J. Aristegui, and R.E. Ulanowicz",
             "Michigan", "Krause, A. and D. Mason",
             "Mondego", "Patricio, J.",
             "Narragan", "Monaco, M.E. and R.E. Ulanowicz",
             "Rhode", "Correll, D",
             "StMarks", "Baird, D., J. Luczkovich and R. R. Christian",
             "baydry",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "baywet",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "cypdry",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "cypwet",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "gramdry",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "gramwet",
             "Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich",
             "mangdry",
             "Ulanowicz, R. E., C. Bondavalli, J. J. Heymans, and M. S. Egnotovich",
             "mangwet",
             "Ulanowicz, R. E., C. Bondavalli, J. J. Heymans, and M. S. Egnotovich"
             )                           

Authors <- matrix(authors, nc=2, byrow=TRUE)

citations <- 
"ChesLower,ChesMiddle,ChesUpper| Hagy, J.D. (2002) Eutrophication, hypoxia
                   and trophic transfer efficiency in Chesapeake Bay PhD
                   Dissertation, University of Maryland at College
                   Park (USA), 446 pp.
Chesapeake|        Baird D. & Ulanowicz R.E. (1989) The seasonal dynamics
                   of the Chesapeake Bay ecosystem. Ecological Monographs
                   59:329-364.
CrystalC,CrystalD| Homer, M. and W.M. Kemp. Unpublished Ms. See also
                   Ulanowicz, R.E. 1986. Growth and Development:
                   Ecosystems Phenomenology. Springer, New York. pp 69-79. 
Maspalomas|        Almunia, J., G. Basterretxea, J. Aristegui, and R.E.
                   Ulanowicz. (1999) Benthic- Pelagic switching in a coastal
                   subtropical lagoon. Estuarine, Coastal and Shelf
                   Science 49:363-384.
Michigan|          Krause, A. and D. Mason. (In preparation.) A. Krause,
                   PhD. Dissertation, Michigan State University.
                   Ann Arbor, MI. USA 
Mondego|           Patricio, J. (In Preparation) Master's Thesis.
                   University of Coimbra, Coimbra, Portugal. 
Narragan|          Monaco, M.E. and R.E. Ulanowicz. (1997) Comparative
                   ecosystem trophic structure of three U.S. Mid-Atlantic
                   estuaries. Mar. Ecol. Prog. Ser. 161:239-254.
Rhode|             Correll, D. (Unpublished manuscript) Smithsonian
                   Institute, Chesapeake Bay Center for Environmental
                   Research, Edgewater, Maryland 21037-0028 USA. 
StMarks|           Baird, D., J. Luczkovich and R. R. Christian. (1998)
                   Assessment of spatial and temporal variability in
                   ecosystem attributes of the St Marks National Wildlife
                   Refuge, Apalachee Bay, Florida. Estuarine, Coastal, and
                   Shelf Science 47: 329-349.
baydry,baywet|     Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich.
                   1998. Network analysis of trophic dynamics in South
                   Florida ecosystems, FY 97: the Florida Bay ecosystem.
                   Annual Report to the United States Geological Service
                   Biological Resources Division, University of Miami Coral
                   Gables, [UMCES] CBL 98-123, Maryland System Center for
                   Environmental Science, Chesapeake Biological Laboratory,
                   Maryland, USA.
cypdry,cypwet|     Ulanowicz, R. E., C. Bondavalli, and M. S. Egnotovich.
                   1997. Network analysis of trophic dynamics in South
                   Florida ecosystems, FY 96: the cypress wetland ecosystem.
                   Annual Report to the United States Geological Service
                   Biological Resources Division, University of Miami Coral
                   Gables, [UM-CES] CBL 97-075, Maryland System Center for
                   Environmental Science, Chesapeake Biological Laboratory.
gramdry,gramwet|   Ulanowicz, R. E., J. J. Heymans, and M. S. Egnotovich.
                   2000. Network analysis of trophic dynamics in South
                   Florida ecosystems, FY 99: the graminoid ecosystem.
                   Technical Report TS-191-99, Maryland System Center for
                   Environmental Science, Chesapeake Biological Laboratory,
                   Maryland, USA.
mangdry,mangwet|   Ulanowicz, R. E., C. Bondavalli, J. J. Heymans, and
                   M. S. Egnotovich. 1999. Network analysis of trophic
                   dynamics in South Florida ecosystems, FY 98: the mangrove
                   ecosystem. Technical Report TS-191-99, Maryland System
                   Center for Environmental Science, Chesapeake Biological
                   Laboratory, Maryland, USA."


Citations <- readLines(textConnection(citations))
Citations2 <- Citations[1]
for (i in 2:length(Citations)) {
  if (grepl("^[ ]", Citations[i])) {
    Citations2[length(Citations2)] <- paste(Citations2[length(Citations2)],
                                            sub("^[ ]*", "", Citations[i]))
  } else {
    Citations2 <- c(Citations2, Citations[i])
  }
}
Citations2 <- strsplit(Citations2, split="|", fixed=TRUE)
ids <- lapply(Citations2, function(x) strsplit(x[1], ",")[[1]])
cits <- sub("^[ ]*", "", sapply(Citations2, "[[", 2))
Citations2 <- cbind(unlist(ids), rep(cits, sapply(ids, length)))

url <- "http://vlado.fmf.uni-lj.si/pub/networks/data/bio/foodweb/foodweb.htm"

name <-
"ChesLower|         Lower Chesapeake Bay in Summer
ChesMiddle|         Middle Chesapeake Bay in Summer
ChesUpper|          Upper Chesapeake Bay in Summer
Chesapeake|         Chesapeake Bay Mesohaline Network
CrystalC|           Crystal River Creek (Control)
CrystalD|           Crystal River Creek (Delta Temp)
Maspalomas|         Charca de Maspalomas
Michigan|           Lake Michigan Control network
Mondego|            Mondego Estuary - Zostrea site
Narragan|           Narragansett Bay Model
Rhode|              Rhode River Watershed - Water Budget
StMarks|            St. Marks River (Florida) Flow network
baydry|             Florida Bay Trophic Exchange Matrix, dry season
baywet|             Florida Bay Trophic Exchange Matrix, wet season
cypdry|             Cypress Dry Season
cypwet|             Cypress Wet Season
gramdry|            Everglades Graminoids - Dry Season
gramwet|            Everglades Graminoids - Wet Season
mangdry|            Mangrove Estuary, Dry Season
mangwet|            Mangrove Estuary, Wet Season"

Name <- read.delim(textConnection(name), sep="|", header=FALSE)
Name[,2] <- sub("^[ ]*", "", Name[,2])

for (n in names(foodwebs)) {
  foodwebs[[n]]$Citation <- Citations2[,2][match(n, Citations2[,1])]
  foodwebs[[n]]$Author   <- Authors[,2][match(n, Authors[,1])]
  foodwebs[[n]]$URL      <- url
  foodwebs[[n]]$name     <- Name[,2][match(n, Name[,1])]
}
  
save(foodwebs, file="/tmp/foodwebs.rda")

#####################################################################

## Konigsberg

library(igraph)

edges <- '
from,to,Euler_letter,name
Altstadt-Loebenicht,Kneiphof,a,Kraemer Bruecke
Altstadt-Loebenicht,Kneiphof,b,Schmiedebruecke
Altstadt-Loebenicht,Lomse,f,Holzbruecke
Kneiphof,Lomse,e,Honigbruecke
Vorstadt-Haberberg,Lomse,g,Hohe Bruecke
Vorstadt-Haberberg,Kneiphof,c,Gruene Bruecke
Vorstadt-Haberberg,Kneiphof,d,Koettelbruecke'

vertices <- "
name,Euler_letter
Altstadt-Loebenicht,B
Kneiphof,A
Vorstadt-Haberberg,C
Lomse,D"

Koenigsberg <- graph_from_data_frame(read.csv(textConnection(edges)),
                                vertices=read.csv(textConnection(vertices)),
                                directed=FALSE)

Koenigsberg$name <- "The seven bidges of Koenigsberg"

save(Koenigsberg, file="/tmp/Koenigsberg.rda")

########################################################################

## Yeast protein interactions

## library(igraph)

## tmp <- tempdir()

## url <- "http://vlado.fmf.uni-lj.si/pub/networks/data/bio/Yeast/yeast.zip"
## yzip <- paste(tmp, sep="/", "y.zip")
## download.file(url=url, destfile=yzip)
## system(paste("cd", tmp, ";", "unzip", yzip))

## YS <- read_graph(paste(tmp, sep="/", "YeastS.net"), format="pajek")
## YL <- read_graph(paste(tmp, sep="/", "YeastL.net"), format="pajek")
## cluLines <- readLines(paste(tmp, sep="/", "Yeast.clu"))
## cluLines <- cluLines[(grep("^\\*vertices", cluLines)+1):length(cluLines)]
## ccode <- c("1"="T", "2"="M", "3"="U", "4"="C", "5"="F", "6"="P",
##            "7"="G", "8"="D", "9"="O", "10"="E", "11"="R", "12"="B", "13"="A")

## V(YS)$name <- V(YS)$id
## V(YS)$Long_name <- V(YL)$id
## YS <- delete_vertex_attr(YS, "id")
## V(YS)$Class <- ccode[cluLines]
## YS$name <- "Yeast protein interaction network by Bu et al. 2003"
## YS$Citation <- "Dongbo Bu, Yi Zhao, Lun Cai, Hong Xue, Xiaopeng Zhu, Hongchao Lu, Jingfen Zhang, Shiwei Sun, Lunjiang Ling, Nan Zhang, Guojie Li and Runsheng Chen: Topological structure analysis of the protein–protein interaction network in budding yeast. Nucl. Acids Res. (2003) 31 (9): 2443-2450."
## YS$Author <- "Dongbo Bu, Yi Zhao, Lun Cai, Hong Xue, Xiaopeng Zhu, Hongchao Lu, Jingfen Zhang, Shiwei Sun, Lunjiang Ling, Nan Zhang, Guojie Li and Runsheng Chen"
## YS$URL <- "http://www.bioinfo.org.cn/PIN/"

## class <-
## "Category,Description,Original MIPS category
##  E,energy production,energy
##  G,aminoacid metabolism,aminoacid metabolism
##  M,other metabolism,all remaining metabolism categories
##  P,translation,protein synthesis
##  T,transcription,\"transcription, but without subcategory 'transcriptional control'\"
##  B,transcriptional control,subcategory 'transcriptional control'
##  F,protein fate,\"protein fate (folding, modification, destination)\"
##  O,cellular organization,cellular transport and transport mechanisms
##  A,transport and sensing,categories 'transport facilitation' and 'regulation of / interaction with cellular environment'
##  R,stress and defense,\"cell rescue, defense and virulence\"
##  D,genome maintenance,DNA processing and cell cycle
##  C,cellular fate / organization,categories 'cell fate' and 'cellular communication / signal transduction' and 'control of cellular organization'
##  U,uncharacterized,categories 'not yet clear-cut' and 'uncharacterized'
## "

## classes <- read.csv(textConnection(class), header=TRUE, stringsAsFactors=FALSE)
## YS$Classes <- classes

## yeast <- YS
## save(yeast, file="/tmp/yeast.rda")

###########################################################################

## Yeast protein interactions, from the van Mering paper

library(igraph)
library(org.Sc.sgd.db)

tmp <- tempdir()

urls <- paste(sep="", "http://www.nature.com/nature/journal/v417/n6887/extref/nature750-s", 1:4, ".doc")
dest <- paste(sep="", tmp, "/s", 1:4, ".txt")
sapply(1:4, function(x) download.file(url=urls[x], destfile=dest[x]))

## Proteins

vert <- readLines(paste(tmp, sep="/", "s1.txt"))
vert <- vert[grep("^Y", vert)[1]:length(vert)]
vert <- vert[vert != ""]

vert12 <- sub("\\][ ].*$", "]", vert)
vert12 <- read.delim(textConnection(paste(vert12, sep="\n")),
                     header=FALSE, stringsAsFactors=FALSE, sep=" ")
vert12[,2] <- sub("\\]", "", sub("\\[", "", vert12[,2]))
colnames(vert12) <- c("name", "Class")

vert3 <- sub("^[^ ]+[ ][^ ]+[ ]", "", vert)

## Connections

int <- readLines(paste(tmp, sep="/", "s4.txt"))
int <- int[grep("^Y", int)[1]:length(int)]
int <- int[int != ""]

fromto <- t(sapply(strsplit(int, "[ ]+"), "[", 1:2))
highconf <- grep("confidence: high", int)
highmed <- grep("confidence: low", int, invert=TRUE)

## Classes

class <-
"Category,Description,Original MIPS category
 E,energy production,energy
 G,aminoacid metabolism,aminoacid metabolism
 M,other metabolism,all remaining metabolism categories
 P,translation,protein synthesis
 T,transcription,\"transcription, but without subcategory 'transcriptional control'\"
 B,transcriptional control,subcategory 'transcriptional control'
 F,protein fate,\"protein fate (folding, modification, destination)\"
 O,cellular organization,cellular transport and transport mechanisms
 A,transport and sensing,categories 'transport facilitation' and 'regulation of / interaction with cellular environment'
 R,stress and defense,\"cell rescue, defense and virulence\"
 D,genome maintenance,DNA processing and cell cycle
 C,cellular fate / organization,categories 'cell fate' and 'cellular communication / signal transduction' and 'control of cellular organization'
 U,uncharacterized,categories 'not yet clear-cut' and 'uncharacterized'
"

classes <- read.csv(textConnection(class), header=TRUE, stringsAsFactors=FALSE)

# Create the network

yeast <- graph_from_data_frame(fromto[highmed,], directed=FALSE)
yeast$name <- "Yeast protein interactions, von Mering et al."
yeast$Citation <- "Comparative assessment of large-scale data sets of protein-protein interactions. Christian von Mering, Roland Krause, Berend Snel, Michael Cornell, Stephen G. Oliver, Stanley Fields and Peer Bork. Nature 417, 399-403 (2002)"
yeast$Author <- "Christian von Mering, Roland Krause, Berend Snel, Michael Cornell, Stephen G. Oliver, Stanley Fields and Peer Bork"
yeast$URL <- "http://www.nature.com/nature/journal/v417/n6887/full/nature750.html"
yeast$Classes <- classes

V(yeast)$Class <- vert12[,2][match(V(yeast)$name, vert12[,1])]
V(yeast)$Description <- vert3[match(V(yeast)$name, vert12[,1])]

E(yeast)$Confidence <- ifelse(grepl("confidence: high", int[highmed]),
                              "high", "medium")

save(yeast, file="/tmp/yeast.rda")

###################################################################

## Zachary karate club

library(igraph)

tmp <- tempdir()

url <- "http://vlado.fmf.uni-lj.si/pub/networks/data/UciNet/zachary.dat"
dest <- paste(tmp, sep="/", "k.dat")
download.file(url=url, destfile=dest)

l <- readLines(dest)
l <- l[(grep("^DATA", l)+1):length(l)]
l1 <- matrix(scan(textConnection(paste(l[1:34], collapse="\n"))), nr=34)
l2 <- matrix(scan(textConnection(paste(l[1:34+34], collapse="\n"))), nr=34)

karate <- graph_from_adjacency_matrix(l2, weighted=TRUE, mode="undirected")
V(karate)$Faction <- c(1,1,1,1,1,1,1,1, 2,2, 1,1,1,1, 2,2, 1,1, 2, 1, 2, 1,
                     2,2,2,2,2,2,2,2,2,2,2,2)
karate$name <- "Zachary's karate club network"
karate$Citation <- "Wayne W. Zachary. An Information Flow Model for Conflict and Fission in Small Groups. Journal of Anthropological Research Vol. 33, No. 4 452-473"
karate$Author <- "Wayne W. Zachary"

save(karate, file="/tmp/karate.rda")

#####################################################################
## US airport network

tab <- read.csv("~/Downloads/1067890998_T_T100D_SEGMENT_ALL_CARRIER.csv")
tab <- tab[ tab$PASSENGERS != 0, ]

tab2 <- tab[,c("ORIGIN", "DEST", "UNIQUE_CARRIER_NAME", "DEPARTURES_PERFORMED", "SEATS", "PASSENGERS", "AIRCRAFT_TYPE", "DISTANCE")]

vert <- rbind(data.frame(name=tab$ORIGIN, CITY=tab$ORIGIN_CITY_NAME),
              data.frame(name=tab$DEST,CITY=tab$DEST_CITY_NAME))
vert <- vert[ !duplicated(vert$name), ]

names(tab2) <- c("from", "to", "Carrier", "Departures", "Seats", "Passengers", "Aircraft", "Distance")
names(vert) <- c("name", "City")

library(igraph)

USairports <- graph_from_data_frame(tab2, vertices=vert)
USairports$name <- "US airports"

## Add positions

temp <- "http://www.armcode.com/airports/airport-%s.htm"

codes <- lapply(letters, function(x) {
  print(x)
  l <- readLines(sprintf(temp, x))
  r <- grep('class="row3"', l, value=TRUE)
  r2 <- sub("<TR><TD[^<]*</TD><TD[^<]*</TD><TD[^<]*</TD><TD[^>]*>", "", r)
  r3 <- grep("^<", r2, invert=TRUE, value=TRUE)
  c1 <- substr(r3, 1, 3)
  c2 <- sub("^.*>(.*)</a></TD></TR>", "\\1", r3)
  list(code=c1, pos=c2)
})

iata <- unlist(lapply(codes, "[[", 1))
pos  <- unlist(lapply(codes, "[[", 2))

miss <- setdiff(V(USairports)$name, iata)
misspos <- sapply(miss, function(code) {
  print(code)
  try({
    l <- readLines(sprintf("http://www.airnav.com/airport/%s", code))
    e <- grep("Lat/Long:&nbsp;", l, value=TRUE)
    e2 <- sub("^.*Lat/Long:&nbsp;.*valign=top>([^<]*)<BR>.*$", "\\1", e)
    g <- gsub("[^NSEW]", "", strsplit(e2, "/",)[[1]])
    co <- round(as.numeric(gsub("[^0-9.]", "", strsplit(e2, "/")[[1]])))
    paste(g, co, sep="")
  })
})

stillmiss <- miss[sapply(misspos, inherits, "try-error")]
stillmiss <- cbind(stillmiss, V(USairports)[stillmiss]$City)
stillpos <- c("344059N 0902050W",
              "664903N 1610120W",
              "572817N 1534855W",
              "573300N 1534500W",
              "581000N 1523000W",
              "574500N 1531900W",
              "552431N 1321945W",
              "621402N 1544405W",
              "642215N 1611326W",
              "635310N 1521807W",
              "603522N 1520928W",
              "594336N 1571533W",
              "630150N 1633158W",
              "551400N 1321300W",
              "555656N 1333943W",
              "555059N 1331340W",
              "551421N 1320651W",
              "581401N 1572101W",
              "561904N 1583526W",
              "592559N 1545827W",
              "560021N 1603338W",
              "605742N 1511954W",
              "591900N 1545500W",
              "355919N 1134836W",
              "174449N 0644218W",
              "181443N 0653836W",
              "581300N 1573000W")

bak <- misspos
misspos[stillmiss[,1]] <- stillpos
misspos <- unlist(sapply(misspos, paste, collapse=" "))

misspos <- sub("([0-9]+)([NS]) ([0-9]+)([WE])", "\\2\\1 \\4\\3", misspos)

iata <- c(iata, names(misspos))
pos <- c(pos, unname(misspos))

V(USairports)$Position <- pos[match(V(USairports)$name, iata)]

save(USairports, file="/tmp/USairports.rda")


#####################################################################
## Kite

kite <- make_graph('krackhardt_kite')
kite$layout <- matrix(nc = 2, byrow = TRUE,
                      c(1,4, 1,2, 2,5, 2,3, 2,1, 3,4, 3,2, 4,3, 5,3, 6,3))
V(kite)$label <- LETTERS[1:10]   # $
V(kite)$name <- V(kite)$label
V(kite)$Firstname <- c("Andre", "Beverly", "Carol", "Diane", "Ed",
                       "Fernando", "Garth", "Heather", "Ike", "Jane")

kite$name <- "Krackhardt's kite"
kite$Citation <- "Assessing the Political Landscape: Structure, Cognition, and Power in Organizations. David Krackhardt. Admin. Sci. Quart. 35, 342-369, 1990."
kite$Author <- "David Krackhardt"
kite$URL <- "http://www.orgnet.com/sna.html"

save(kite, file = "/tmp/kite.rda")

#####################################################################
## ENRON

vert <- read.delim("http://www.cis.jhu.edu/~parky/Enron/employees",
                   col.names = c("email", "other"),
                   header = FALSE, stringsAsFactors = FALSE)
vert$name <- sapply(strsplit(vert$other, "  [ ]*"), "[[", 1)
vert$note <- paste(sapply(strsplit(vert$other, "  [ ]*"), "[", 2),
                   sep = ", ",
                   sapply(strsplit(vert$other, "  [ ]*"), "[", 3))
vert$note <- gsub("N/A", "NA", vert$note)
vert$note <- gsub(", NA", "", vert$note)
vert$name <- gsub("xxx", "NA", vert$name)

edges <- read.delim("http://www.cis.jhu.edu/~parky/Enron/execs.email.linesnum",
                    header = FALSE, col.names = c("time", "from", "to"),
                    stringsAsFactors = FALSE, sep = " ")

tags <- read.delim("http://www.cis.jhu.edu/~parky/Enron/execs.email.lines2",
                   header = FALSE, col.names = c("time", "from", "to", "tag"),
                   stringsAsFactors = FALSE, sep = " ")

all(tags[,1:3] == edges)

topics <- read.delim("http://www.cis.jhu.edu/~parky/Enron/execs.email.linesnum.topic",
                     header = TRUE, col.names = c("time", "from", "to", "topic"),
                     stringsAsFactors = FALSE, sep = " ")

all(topics[,1:3] == edges)

ldc_topics <- read.delim("http://www.cis.jhu.edu/~parky/Enron/execs.email.linesnum.ldctopic",
                     header = TRUE, col.names = c("time", "from", "to", "ldc_topic"),
                     stringsAsFactors = FALSE, sep = " ")

all(ldc_topics[,1:3] == edges)

ldc <- c("Calif_analysis", "Calif_bankruptcy", "Calif_utilities",
         "Calif_crisis_legal", "Calif_enron", "Calif_federal",
         "Newsfeed_Calif", "Calif_legis", "Daily_business",
         "Educational", "EnronOnline", "Kitchen_daily",
         "Kitchen_fortune", "Energy_newsfeed", "General_newsfeed",
         "Downfall", "Downfall_newsfeed", "Broadband",
         "Federal_gov", "FERC_DOE", "College Football",
         "Pro Football", "India_General", "India_Dabhol",
         "Nine_eleven", "Nine_Eleven_Analysis", "Dynegy",
         "Sempra", "Duke", "El Paso",
         "Pipelines", "World_energy")


ldc_desc_text <- "
Executive summaries and analyses about the California situation. (304
entries)

Specifically mentioned financial difficulties of the utilities such as
Southern California Edison (SoCal Edison) and Pacific Gas & Electric
(PG & E). (36 entries)

General references to California utility companies: Edison, Pacific Gas &
Electric, and the California Public Utility Commission (CPUC) which
regulates them. (116)

Articles about legal issues surrounding California energy crisis.  (109)

Enron business emails about the day to day operations of managing the
California side of their business. (699)

Emails about FERC (Federal Energy Regulatory Commission), U.S.  Senate
Hearings. (61)

Long emails with a host of stories about California. These emails were news
feeds from wire services such as Reuters and Dow Jones, which were widely
circulated among Enron employees. (190)

Emails about California legislature, bills in the California legislature or
California Governor Gray Davis that are not related to the specifics such
as bankruptcy or the energy crisis. (181)

As one might expect, the majority of the emails in this collection are
emails about the regular day to day activities of a multinational energy
company (i.e. “ trade this share, buy these shares,” etc.). Other daily
business emails include setting up meetings, confirming meetings, and
general announcements from human resources.  These almost defy
categorization by topic, but they do have a value. Researchers may decide
to remove these emails to reduce the amount of noise in the collection and
to improve their ability to detect topics. However keeping them in the
collection provides an element of noise that gives the collection a “real
life” quality. Either way by tagging such emails, the researcher has the
option. (1595)

This was a surprise topic that emerged later. It related to Enron's
interns, scholarships or employees who are professors. Many of these emails
center around the Head of the Research Group Vince Kaminski who taught at
Rice University in Houston part time. (92)

Enrononline is the electronic trading and information software tool that
the Enron traders used. It was an invaluable asset to the company and gave
them an edge on their competitors. Louise Kitchen was an early developer of
the technology.  (271)

Daily emails to and from Louise Kitchen who developed Enrononline. This
category includes questions to Kitchen about running EOL and trading
information. (37)

Louise Kitchen was selected as one to the top corporate women in a Fortune
magazine story (September 2001). (11)

Wire news feeds about various energy issues. Think of it as an electronic
newsletter about energy that is circulation to a number of Enron employees.
Usually these are lengthy emails. (332)

Long emails (wire feeds) with a host of general national and international
stories. (48)

Articles about Enron's demise. Messages from employees worrying about what
is going on. This includes announcements from management about “not
worrying about it.” (158)

Wire stories about Enron's demise. (48)

Enron Broadband Services (EBS) Enron's failed Broadband (high speed cable
to deliver entertainment) venture. (26)

General information about Federal government that does not specifically
mention California. (85)

General information about the Federal Energy Regulatory
Commission/Department of Energy. (219)

Employee emails about college football more specifically a newsletter
called TruOrange, which follows University of Texas football. (100)

Employee emails about professional football (The NFL), but these refer to
fantasy pro football leagues, where the statistics of real players are used
to play an online version of football. (6)

General information about the India energy issues. (38)

Specific references to India Dabhol Power Company (DPC), the Maharastra
State Electricity Board (MSEB), and the Indian province of Maharastra. (79)

The terrorist attack of September 11, 2001. Mostly newscasts and
updates. (29)

Aftermath analysis (political and economic) resulting from the attack. (30)

This company was a competitor of Enron. They almost purchased Enron in
Oct-Nov. 2001, but let Enron plummet into bankruptcy instead. (7)

A utilities company that works with Enron. (16)

Emails about Duke Energy. (17)

Emails about El Paso Energy/Pipeline Company. (34)

General pipeline management. Note that pipelines are important part in
transporting energy from one place to another. Enron’s original business
was a pipeline business. (17)

A general category about energy with one or more specific geographic
locations (such as Asia, Africa) that is not about India. (25)
"

ldc_desc <- strsplit(ldc_desc_text, "\n\n")[[1]]
ldc_desc <- gsub("\n", " ", ldc_desc)
ldc_desc <- gsub("^[[:space:]]+", "", ldc_desc)
ldc_desc <- gsub("[[:space:]]+$", "", ldc_desc)

reciptype_code <- c("0" = "to", "1" = "cc", "2" = "bcc")
reciptype <- unname(reciptype_code[as.character(tags[,4])])
g_edges <- data.frame(
  stringsAsFactors = FALSE,
  edges,
  reciptype = reciptype,
  topic = topics[,4],
  ldc_topic = ldc_topics[,4]
)

g_edges$time <- as.character(as.POSIXct(edges$time, origin = "1970-01-01",
                                         tz = "UTC"))
g_edges <- g_edges[c("from", "to", "time", "reciptype", "topic", "ldc_topic")]
names(g_edges) <- c("from", "to", "Time", "Reciptype", "Topic", "LDC_topic")

g_vert <- cbind(id = seq_len(nrow(vert)) - 1, vert)
g_vert <- g_vert[, colnames(g_vert) != "other"]
names(g_vert) <- c("id", "Email", "Name", "Note")

enron <- make_directed_graph(t(as.matrix(g_edges[,1:2])) + 1)

V(enron)$Email <- g_vert$Email
V(enron)$Name <- g_vert$Name
V(enron)$Note <- g_vert$Note

E(enron)$Time <- g_edges$Time
E(enron)$Reciptype <- g_edges$Reciptype
E(enron)$Topic <- g_edges$Topic
E(enron)$LDC_topic <- g_edges$LDC_topic

enron$LDC_names <- ldc
enron$LDC_desc <- ldc_desc
enron$name <- "Enron email network"
enron$Citation <- c('C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park, "Scan Statistics on Enron Graphs," Computational and Mathematical Organization Theory, Volume 11, Number 3, p229 - 247, October 2005, Springer Science+Business Media B.V.')

#####################################################################
## RFID

library(sand)
data(hc)

edges <- hc[,c(2,3,1)]
vv <- character(max(hc[,2:3]))
vv[hc$ID1] <- as.character(hc$S1)
vv[hc$ID2] <- as.character(hc$S2)

v <- data.frame(id = seq_along(vv), Status = vv, stringsAsFactors = FALSE)

rfid <- graph_from_data_frame(edges, vertices = v, directed = FALSE)
rfid <- delete_vertex_attr(rfid, 'name')

rfid$name <- "RFID hospital encounter network"
rfid$Citation <- "P. Vanhems, A. Barrat, C. Cattuto, J.-F. Pinton, N. Khanafer,   C. Regis, B.-a. Kim, B. Comte, N. Voirin: Estimating potential   infection transmission routes in hospital wards using wearable   proximity sensors. PloS One 8(9), e73970 306 (2013)."
