% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/formatCheckParameterCd.r
\name{formatCheckParameterCd}
\alias{formatCheckParameterCd}
\title{formatCheckParameterCd}
\usage{
formatCheckParameterCd(parameterCd, interactive = TRUE)
}
\arguments{
\item{parameterCd}{character to check}

\item{interactive}{logical Option for interactive mode.  If true, there is user interaction for error handling and data checks.}
}
\value{
parameterCd character
}
\description{
Checks that the parameter code is 5 digits. If it is less, it will pad the character with zeros. If more, ask the user to re-enter.
}
\examples{
pCode <- '01234'
formatCheckParameterCd(pCode)
}
\keyword{WRTDS}
\keyword{flow}

