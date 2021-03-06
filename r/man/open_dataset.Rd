% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset.R
\name{open_dataset}
\alias{open_dataset}
\title{Open a multi-file dataset}
\usage{
open_dataset(sources, schema = NULL, partitioning = hive_partition(), ...)
}
\arguments{
\item{sources}{Either (1) a string path to a directory containing data files,
or (2) a list of \code{SourceFactory} objects as created by \code{\link[=open_source]{open_source()}}.}

\item{schema}{\link{Schema} for the dataset. If \code{NULL} (the default), the schema
will be inferred from the data sources.}

\item{partitioning}{When \code{sources} is a file path, one of
\itemize{
\item A \code{Schema}, in which case the file paths relative to \code{sources} will be
parsed, and path segments will be matched with the schema fields. For
example, \code{schema(year = int16(), month = int8())} would create partitions
for file paths like "2019/01/file.parquet", "2019/02/file.parquet", etc.
\item A character vector that defines the field names corresponding to those
path segments (that is, you're providing the names that would correspond
to a \code{Schema} but the types will be autodetected)
\item A \code{HivePartitioning} or \code{HivePartitioningFactory}, as returned
by \code{\link[=hive_partition]{hive_partition()}} which parses explicit or autodetected fields from
Hive-style path segments
\item \code{NULL} for no partitioning
}}

\item{...}{additional arguments passed to \code{open_source()}, when \code{sources} is
a file path, otherwise ignored.}
}
\value{
A \link{Dataset} R6 object. Use \code{dplyr} methods on it to query the data,
or call \verb{$NewScan()} to construct a query directly.
}
\description{
Open a multi-file dataset
}
\seealso{
\link{Partitioning} for defining partitions
}
