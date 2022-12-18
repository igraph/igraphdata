\docType{data}
\name{enron}
\alias{enron}
\title{Enron Email Network}
\format{
  A directed \code{igraph} graph object.

  Graph attributes: \itemize{
    \item \sQuote{LDC_names} The names of the 32 LDC catagories the emails
    are classfied into by Michael W. Berry
    (\url{http://www.cis.jhu.edu/~parky/Enron/Anno_Topic_exp_LDC.pdf})
    \item \sQuote{LDC_desc} Longer descriptions of the 32 LDC
    categories.
    \item \sQuote{Citation} Additionally, see also the references below.
    \item \sQuote{name}
  }

  Vertex attributes: \itemize{
    \item \sQuote{Email} Email address.
    \item \sQuote{Name} Real name.
    \item \sQuote{Note} E.g. position at Enron.
  }

  Edge attributes: \itemize{
    \item \sQuote{Time} When the email was sent. Note that some time
    labels are from 1979, these are certainly wrong and you might want
    to remove them before analyses that include time.
    \item \sQuote{Reciptype} Recipient type, \sQuote{to}, \sQuote{cc} or
    \sQuote{bcc}.
    \item \sQuote{Topic} Assigned based on 3-means clustering of
    randomly selected 3,120 out of all 125,409 messages, then NN
    classification for the whole corpus. Note that topic 0 means an
    outlier, e.g., too few words or all meaningless numbers in the
    message body.
    \item \sQuote{LDC_topic} Assigned based on Michael W. Berry's 2001
    \dQuote{Annotated (by Topic) Enron Email Data Set.}
    (\url{http://www.cis.jhu.edu/~parky/Enron/Anno_Topic_exp_LDC.pdf})
    There are 32 topics. Topic "0" means an outlier, e.g., too few words
    or all meaningless numbers in the message body, etc. Topic "-1"
    means there is no matching topic.
  }
}
\source{
  \url{http://www.cis.jhu.edu/~parky/Enron/}
}
\usage{
enron
}
\description{
  An Enron email dataset has been made public by the U.S. Department of Justice.
}
\references{
  C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park,
  Scan Statistics on Enron Graphs Computational and Mathematical
  Organization Theory, Volume 11, Number 3, p229 - 247, October 2005,
  Springer Science+Business Media B.V.

  C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park,
  Scan Statistics on Enron Graphs, SIAM International Conference on
  Data Mining, Workshop on Link Analysis, Counterterrorism and Security,
  Newport Beach, California, April 23, 2005.

  Gina Kolata, Enron Offers an Unlikely Boost to E-Mail Surveillance,
  New York Times, Week in Review, May 22, 2005.

  C.E. Priebe, Scan Statistics on Enron Graphs, IPAM Summer Graduate
  School: Intelligent Extraction of Information from Graphs and High
  Dimensional Data, UCLA, July 11-29, 2005.

  C.E. Priebe, Scan Statistics on Enron Graphs, 2005 Fall Department
  of Applied Mathematics and Statistics Seminars, September 15, 2005,
  The Johns Hopkins University.

  Y. Park, C.E. Priebe, D.J. Marchette, Scan Statistics on Enron
  Hypergraphs, Interface 2008, Durham, North Carolina, May 21, 2008,

  Y. Park, C.E. Priebe, D.J. Marchette, Anomaly Detection using Scan
  Statistics on Enron Graphs and Hypergraphs, The Satellite Workshop of
  the IASC 2008 Conference, Seoul, Korea, December 1-3, 2008.

  Y. Park, C.E. Priebe, D.J. Marchette, A. Youssef, Anomaly Detection
  using Scan Statistics on Time Series of Hypergraphs, Workshop on Link
  Analysis, Counterterrorism and Security at the SIAM International
  Conference on Data Mining, Sparks, Nevada, May 1-3, 2009,

  Y. Park, C.E. Priebe, A. Youssef, Anomaly Detection in Time Series of
  Graphs using Fusion of Invariants, Computational and Mathematical
  Organization Theory, submitted, 2010.
}
