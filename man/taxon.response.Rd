% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxon.response.r
\name{taxon.response}
\alias{taxon.response}
\title{Plot Taxa Response Curve and Calculate Species Extirpation Concentrations}
\usage{
taxon.response(spdata, envdata, sp.siteid = "Sample.ID",
  species = "GENUS", sp.abndid = "RA", env.siteid = "Sample.ID",
  xvar = "COND", cutoff = 30, region = "all", lim = "CDF",
  coord = NULL, mtype = 3, dense.N = 201, plot.pdf = F,
  add.map = F, statename = NULL, add.lab = F,
  main = "Capture Probability of Macroinvertebrate Taxon Along Conductivity Gradient",
  mar = c(5, 4, 3, 2), xlabs = expression(paste("Conductivity ( ", mu,
  "S/cm)")), log.x = TRUE, rounder = 0, taus = c(0, 95, 100),
  nbin = 61, wd = getwd())
}
\arguments{
\item{spdata}{Species data.}

\item{envdata}{Environmental data.}

\item{sp.siteid}{Site/sample id column for spdata; default = "Sample.ID"}

\item{species}{; default = "GENUS"}

\item{sp.abndid}{Name of column for species relative abundance within sample; default = "RA"}

\item{env.siteid}{Site/sample id column for envdata; default = "Sample.ID"}

\item{xvar}{xvariable, could be column index or name; default = "COND"}

\item{cutoff}{a required minimum sample size for calculation; default = 30}

\item{region}{Region (e.g., ecoregion or bioregion) used to create directory for PDF output; default = "all"}

\item{lim}{if lim == "GAM", add gam plot xc95 otherwise, add   "CDF"; default ="CDF"}

\item{coord}{; default = NULL}

\item{mtype}{could be 1 to 3, indicating which regression model to use; default = 3}

\item{dense.N}{is the number of areas to cut into in the calculation of area under the curve; default = 201}

\item{plot.pdf}{to decide if we want species vs. env plots options "none", "pdf", "tiff"; default = F}

\item{add.map}{to decide if a map should be added before plots; default =F}

\item{statename}{; default = NULL}

\item{add.lab}{; default = F}

\item{main}{Plot title (main); default = "Capture Probability of Macroinvertebrate Taxon Along Conductivity Gradient"}

\item{mar}{; default = c(5,4,3, 2)}

\item{xlabs}{; default = expression(paste("Conductivity ( ", mu, "S/cm)"))}

\item{log.x}{if xvar should be logtransformated; default = TRUE}

\item{rounder}{xvar rounder, default = 0.}

\item{taus}{determine the output the percentile of env variable; default = c(0,95,100)}

\item{nbin}{Number of bins; default = 61.}

\item{wd}{Working directory for saving files.}
}
\value{
data frame and PDFS of CDF and GAM plots saved to the specified directory in subfolders ("cdf" and "gam")
}
\description{
The output of this function to return 1.Weighted Average, 2. cdf_Abundance based, 3. cdf_ presence/absence based;
4. ecdf weighted, 5. cdf weight new; 6. Linear logistic regression, 7. quadratic logistic 8. GAM  5~7 using full data range;
9~11. repeat 6~8 but uses observed range for each single taxon; 12 Count. 13. Raw quantiles
}
\examples{
# Environmental Variables
varlist <- c("lgX3daymax", "lgMAF", "lgFallrate", "lgHigh1fall", "RBI",	"lgX3daymin")
varnames <- c("3-day Max", "Mean Annual Flow", "Fall Rate", "High 1 Fall", "RBI", "3-Day Min")
# select variable
vari <- 1
mydata <- envdata.all[!is.na(envdata.all[,varlist[vari]]),]
# run function
whole.values <- taxon.response(spdata = species, envdata = mydata,  sp.siteid = "BenSampID", species = "OTU",
sp.abndid = "RA", env.siteid = "BenSampID", xvar = varlist[vari], cutoff = 20, region = "tol_all", lim ="GAM",
coord = c("BioSta_Long", "BioSta_Lat"), mtype = 3, dense.N = 201, plot.pdf = T, add.map = F, statename = NULL,
add.lab = F, main = paste("Macroinvertebrates Response to", varnames[vari]), mar = c(5,4,3,2),
xlabs= varnames[vari], log.x = F, rounder = 3, taus = c(0,50,100), nbin = 51, wd = getwd())
# view results
View(whole.values)
}
\keyword{cdf,}
\keyword{gam,}
\keyword{hc05,}
\keyword{logistic}
\keyword{quantiles,}
\keyword{regression,}
\keyword{response}
\keyword{taxon}
\keyword{xc95,}
