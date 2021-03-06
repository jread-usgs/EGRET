% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/plotContours.R
\name{plotContours}
\alias{plotContours}
\title{Color contour plot of the estimated surfaces as a function of discharge and time (surfaces include log concentration, standard error, and concentration)}
\usage{
plotContours(eList, yearStart, yearEnd, qBottom, qTop, whatSurface = 3,
  qUnit = 2, contourLevels = NA, span = 60, pval = 0.05,
  printTitle = TRUE, vert1 = NA, vert2 = NA, horiz = NA, tcl = 0.1,
  flowDuration = TRUE, customPar = FALSE, yTicks = NA, tick.lwd = 2,
  lwd = 1, cex.main = 1, cex.axis = 1,
  color.palette = colorRampPalette(c("white", "gray", "blue", "red")), ...)
}
\arguments{
\item{eList}{named list with at least the Daily and INFO dataframes, and surfaces matrix}

\item{yearStart}{numeric value for the starting date for the graph, expressed as decimal year (typically whole number such as 1989.0)}

\item{yearEnd}{numeric value for the ending date for the graph, expressed as decimal year, (for example 1993.0)}

\item{qBottom}{numeric value for the bottom edge of the graph, expressed in the units of discharge that are being used (as specified in qUnit)}

\item{qTop}{numeric value for the top edge of the graph, expressed in the units of discharge that are being used (as specified in qUnit)}

\item{whatSurface}{numeric value, can only accept 1, 2, or 3;  whatSurface=1 is yHat (log concentration), whatSurface=2 is SE (standard error of log concentration), and whatSurface=3 is ConcHat (unbiased estimate of concentration), default = 3}

\item{qUnit}{object of qUnit class. \code{\link{printqUnitCheatSheet}}, or numeric represented the short code, or character representing the descriptive name.}

\item{contourLevels}{numeric vector containing the contour levels for the contour plot, arranged in ascending order, default is NA (which causes the contour levels to be set automatically, based on the data)}

\item{span}{numeric, it is the half-width (in days) of the smoothing window for computing the flow duration information, default = 60}

\item{pval}{numeric, the probability value for the lower flow frequency line on the graph}

\item{printTitle}{logical variable if TRUE title is printed, if FALSE not printed}

\item{vert1}{numeric, the location in time for a black vertical line on the figure, yearStart<vert1<yearEnd, default is NA (vertical line is not drawn)}

\item{vert2}{numeric, the location in time for a black vertical line on the figure, yearStart<vert2<yearEnd, default is NA (vertical line is not drawn)}

\item{horiz}{numeric, the location in discharge for a black horizontal line on the figure, qBottom<vert1<qTop, default is NA (no horizontal line is drawn)}

\item{tcl}{numeric, length of tick marks in inches, default is 0.1}

\item{flowDuration}{logical variable if TRUE plot the flow duration lines (5 and 95 flow percentiles), if FALSE do not plot them, default = TRUE}

\item{customPar}{logical defaults to FALSE. If TRUE, par() should be set by user before calling this function
(for example, adjusting margins with par(mar=c(5,5,5,5))). If customPar FALSE, EGRET chooses the best margins.}

\item{yTicks}{vector of yTick labels and marks that will be plotted in log space. If NA, will be automatically generated.}

\item{tick.lwd}{line width for axis ticks, default is 2}

\item{lwd}{numeric, line width of flowDuration curve, default is 1}

\item{cex.main}{magnification to be used for main titles relative to the current setting of cex}

\item{cex.axis}{magnification to be used for axis annotation relative to the current setting of cex}

\item{color.palette}{a function that creates a color palette for the contour plot. Default goes from white to gray to blue to red
using the function \code{colorRampPalette(c("white","gray","blue","red"))}. A few preset options are heat.colors, topo.colors, and terrain.colors.}

\item{\dots}{arbitrary functions sent to the generic plotting function.  See ?par for details on possible parameters}
}
\description{
These plots are normally used for plotting the estimated concentration surface (whatSurface=3) but can be used to explore the
estimated surfaces for the log of concentration or for the standard error (in log space) which is what determines the bias correction.
The plots are often more interpretable when the time limits are only about 4 years apart.
To explore changes over a long time period it is best to do this multiple times, for various time slices of 4 years (for example) or to use the function \code{plotDiffContours}.

Although there are a lot of optional arguments to this function, most are set to a logical default.

Data come from named list, which contains a Sample dataframe with the sample data,
a Daily dataframe with the daily flow data,
and an INFO dataframe with metadata.
}
\examples{
yearStart <- 2001
yearEnd <- 2010
qBottom <- 0.5
qTop<- 20
clevel <- seq(0,3.5,0.5)
eList <- Choptank_eList
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
      contourLevels = clevel)
yTicksModified <- c(.1,1,10,25)
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
      contourLevels = clevel,yTicks=yTicksModified,flowDuration=FALSE)
colors <- colorRampPalette(c("white","red"))
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
       contourLevels = clevel,yTicks=yTicksModified,
       color.palette=colors,flowDuration=FALSE)
colors2 <- heat.colors # Some other options: topo.colors, terrain.colors, cm.colors
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
       contourLevels = clevel,color.palette=colors2,lwd=2,flowDuration=FALSE)
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
       contourLevels = clevel,cex.axis=2,flowDuration=FALSE)
par(mar=c(5,8,5,8))
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
       contourLevels = clevel,customPar=TRUE,printTitle=FALSE,flowDuration=FALSE)
}
\keyword{graphics}
\keyword{statistics}
\keyword{water-quality}

