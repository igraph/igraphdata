<!-- README.md is generated from README.Rmd. Please edit that file -->

# Data sets for the igraph R package

<!-- badges: start -->

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html) [![R build status](https://github.com/igraph/igraphdata/workflows/rcc/badge.svg)](https://github.com/igraph/igraphdata/actions) [![Codecov test coverage](https://codecov.io/gh/igraph/igraphdata/branch/main/graph/badge.svg)](https://app.codecov.io/gh/igraph/igraphdata?branch=main) [![CRAN status](https://www.r-pkg.org/badges/version/igraphdata)](https://CRAN.R-project.org/package=igraphdata) [![Launch rstudio.cloud](https://img.shields.io/badge/rstudio-cloud-blue.svg)](https://rstudio.cloud/project/523482)

<!-- badges: end -->

This is a data R package, that contains network data sets, to be used with the igraph R package.

## Installation

From CRAN:

<pre class='chroma'>
<span><span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"igraphdata"</span><span class='o'>)</span></span></pre>

You can install the development version from Github, using the [devtools package](https://github.com/r-lib/devtools):

<pre class='chroma'>
<span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"igraph/igraphdata"</span><span class='o'>)</span></span></pre>

## Usage

<pre class='chroma'>
<span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://igraph.org/'>igraphdata</a></span><span class='o'>)</span></span>
<span><span class='nf'><a href='https://rdrr.io/r/utils/data.html'>data</a></span><span class='o'>(</span>package <span class='o'>=</span> <span class='s'>"igraphdata"</span><span class='o'>)</span></span></pre>
<pre class='chroma'>
<span><span class='c'>#&gt; Data sets in package 'igraphdata':</span></span>
<span><span class='c'>#&gt; </span></span>
<span><span class='c'>#&gt; Koenigsberg             Bridges of Koenigsberg from Euler's times</span></span>
<span><span class='c'>#&gt; UKfaculty               Friendship network of a UK university faculty</span></span>
<span><span class='c'>#&gt; USairports              US airport network, 2010 December</span></span>
<span><span class='c'>#&gt; enron                   Enron Email Network</span></span>
<span><span class='c'>#&gt; foodwebs                A collection of food webs</span></span>
<span><span class='c'>#&gt; immuno                  Immunoglobulin interaction network</span></span>
<span><span class='c'>#&gt; karate                  Zachary's karate club network</span></span>
<span><span class='c'>#&gt; kite                    Krackhardt's kite</span></span>
<span><span class='c'>#&gt; macaque                 Visuotactile brain areas and connections</span></span>
<span><span class='c'>#&gt; rfid                    Hospital encounter network data</span></span>
<span><span class='c'>#&gt; yeast                   Yeast protein interaction network</span></span></pre>

# License

CC BY-SA 4.0, plus see [LICENSE](LICENSE) for the licenses of the individual data sets.
