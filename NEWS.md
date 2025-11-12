

# igraphdata 1.0.1.9015

## Continuous integration

- Fix reviewdog and add commenting workflow (#51).


# igraphdata 1.0.1.9014

## Bug fixes

- Improve netzschleuder internals (#38, #40).

## Features

- New `ns_graph()` and lower-level `ns_df()` and `ns_metadata()` to download from [netzschleuder](https://networks.skewed.de) (#22, #23).

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/igraph/igraphdata/actions/runs/17451565865

- Auto-update from GitHub Actions.

  Run: https://github.com/igraph/igraphdata/actions/runs/14636196541

## Continuous integration

- Use workflows for fledge (#50).

- Sync (#49).

- Use reviewdog for external PRs (#48).

- Cleanup and fix macOS (#47).

- Format with air, check detritus, better handling of `extra-packages` (#46).

- Enhance permissions for workflow (#41).

- Permissions, better tests for missing suggests, lints (#39).

- Only fail covr builds if token is given (#34).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#30).

- Correct installation of xml2 (#29).

- Explain (#28).

- Add xml2 for covr, print testthat results (#27).

- Fix (#26).

- Sync (#25).

## Documentation

- Add DOI for karate (@maelle, #37).

- Add DOI for macaque dataset (@maelle, #44).

- Add DOI for rfid data (@maelle, #45).

- Add reference for lesmis (@maelle, #43).

- Add 2 DOIs for enron (@maelle, #36).

- Add reference for Koenigsberg data, improve Wikipedia link (@maelle, #42).

- Add my ORCID (#24).

- Added a DOI to the UKfaculty citation.

## Uncategorized

- Docs: correct claim about Krackhardt's kite being the smallest network.


# igraphdata 1.0.1.9013

## Continuous integration

- Avoid failure in fledge workflow if no changes (#19).


# igraphdata 1.0.1.9012

## Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#18).


# igraphdata 1.0.1.9011

## Continuous integration

- Use stable pak (#17).


# igraphdata 1.0.1.9010

## Continuous integration

  - Trigger run (#15).
    
      - ci: Trigger run
    
      - ci: Latest changes


# igraphdata 1.0.1.9009

## Continuous integration

  - Use pkgdown branch (#14).
    
      - ci: Use pkgdown branch
    
      - ci: Updates from duckdb
    
      - ci: Trigger run


# igraphdata 1.0.1.9008

## Continuous integration

  - Install via R CMD INSTALL ., not pak (#13).
    
      - ci: Install via R CMD INSTALL ., not pak
    
      - ci: Bump version of upload-artifact action


# igraphdata 1.0.1.9007

## Chore

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/igraph/igraphdata/actions/runs/10425484116

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/igraph/igraphdata/actions/runs/10200109769

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/igraph/igraphdata/actions/runs/9728439599

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/igraph/igraphdata/actions/runs/9691615086

## Continuous integration

  - Install local package for pkgdown builds.

  - Improve support for protected branches with fledge.

  - Improve support for protected branches, without fledge.

  - Sync with latest developments.

  - Use v2 instead of master.

  - Inline action.

  - Use dev roxygen2 and decor.

  - Fix on Windows, tweak lock workflow.

  - Avoid checking bashisms on Windows.

  - Better commit message.

  - Bump versions, better default, consume custom matrix.

  - Recent updates.


# igraphdata 1.0.1.9006

- Internal changes only.


# igraphdata 1.0.1.9005

## Chore

- Change maintainer (#7).


# igraphdata 1.0.1.9004

## Chore

- Update download link for yeast (#8, #9).


# igraphdata 1.0.1.9003

## Chore

- Load igraph package when loading this package.

- Compress as xz, in version 2.


# igraphdata 1.0.1.9002

## Features

- Import igraph.

- Upgrade graphs to igraph 1.5.0.

## Chore

- Igraph on CRAN now.

- Turn off Travis and AppVeyor (#10).

- Move README.\* to root.


# igraphdata 1.0.1.9001

## Features

- New `lesmis_*()` functions (@krlmlr, #3).

## Chore

- Add tests (#5).

- Convert documentation to roxygen2 and Markdown (@krlmlr, #4).

- Build-ignore.

- README tweaks.


# igraphdata 1.0.1.9000

- Internal changes only.


# igraphdata 1.0.1

- First version with a NEWS file.

- Get rid of `R CMD check` warning for marked UTF-8 characters.

# igraphdata 1.0.0

- Last version without a NEWS file.
